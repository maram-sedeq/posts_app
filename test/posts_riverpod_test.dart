import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';
import 'package:posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_page.dart';
import 'package:posts_app/features/posts/presentation/providers/posts_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Posts Riverpod UI', () {
    testWidgets('shows loading, then all posts', (tester) async {
      final repository = FakePostsRepository();
      repository.pendingLoad = Completer<Either<Failure, List<Post>>>();

      await tester.pumpWidget(await buildApp(repository));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      repository.pendingLoad!.complete(Right(repository.posts));
      await tester.pumpAndSettle();

      expect(find.text('Post 1'), findsOneWidget);
      expect(find.text('Post body 1'), findsOneWidget);
      expect(find.text('Post 2'), findsOneWidget);
    });

    testWidgets('pull to refresh requests the posts again', (tester) async {
      final repository = FakePostsRepository.withManyPosts(30);

      await tester.pumpWidget(await buildApp(repository));
      await tester.pumpAndSettle();
      expect(repository.loadCount, 1);

      await tester.drag(find.byType(ListView), const Offset(0, 450));
      await tester.pumpAndSettle();

      expect(repository.loadCount, greaterThanOrEqualTo(2));
    });

    testWidgets('adds a post and displays the success message', (tester) async {
      final repository = FakePostsRepository();

      await tester.pumpWidget(await buildApp(repository));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'New post');
      await tester.enterText(find.byType(TextFormField).at(1), 'New body');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('Post Added Successfully'), findsOneWidget);
      expect(find.text('New post'), findsOneWidget);
      expect(repository.posts.last.id, isNotNull);
    });

    testWidgets('edits an existing post', (tester) async {
      final repository = FakePostsRepository();

      await tester.pumpWidget(await buildApp(repository));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Post 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(0), 'Edited title');
      await tester.enterText(find.byType(TextFormField).at(1), 'Edited body');
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();

      expect(find.text('Post Updated Successfully'), findsOneWidget);
      expect(find.text('Edited title'), findsOneWidget);
      expect(repository.posts.first.id, 1);
    });

    testWidgets('deletes only after confirmation', (tester) async {
      final repository = FakePostsRepository();

      await tester.pumpWidget(await buildApp(repository));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Post 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(repository.deletedIds, isEmpty);
      await tester.tap(find.text('Yes'));
      await tester.pumpAndSettle();

      expect(repository.deletedIds, [1]);
      expect(find.text('Post Deleted Successfully'), findsOneWidget);
      expect(find.text('Post 1'), findsNothing);
    });

    testWidgets('shows a useful message when loading fails', (tester) async {
      final repository = FakePostsRepository()..loadFailure = true;

      await tester.pumpWidget(await buildApp(repository));
      await tester.pumpAndSettle();

      expect(find.text('Please try again later .'), findsOneWidget);
    });
  });

  test('uses cached posts when there is no internet connection', () async {
    final cachedPosts = [
      const Post(id: 10, title: 'Cached title', body: 'Cached body'),
    ];
    final repository = PostRepositoryImpl(
      remoteDataSource: FakeRemoteDataSource(),
      localDataSource: FakeLocalDataSource(cachedPosts),
      networkInfo: const FakeNetworkInfo(connected: false),
    );

    final result = await repository.getAllPosts();

    expect(result.isRight(), isTrue);
    expect(result.getOrElse(() => []), cachedPosts);
  });
}

Future<Widget> buildApp(FakePostsRepository repository) async {
  SharedPreferences.setMockInitialValues({});
  final preferences = await SharedPreferences.getInstance();

  return ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(preferences),
      postsRepositoryProvider.overrideWith((ref) => repository),
    ],
    child: const MaterialApp(home: PostsPage()),
  );
}

class FakePostsRepository implements PostsRepository {
  FakePostsRepository()
    : posts = [
        const Post(id: 1, title: 'Post 1', body: 'Post body 1'),
        const Post(id: 2, title: 'Post 2', body: 'Post body 2'),
      ];

  FakePostsRepository.withManyPosts(int count)
    : posts = List.generate(
        count,
        (index) => Post(
          id: index + 1,
          title: 'Post ${index + 1}',
          body: 'Post body ${index + 1}',
        ),
      );

  final List<Post> posts;
  final List<int> deletedIds = [];
  int loadCount = 0;
  int nextId = 100;
  bool loadFailure = false;
  Completer<Either<Failure, List<Post>>>? pendingLoad;

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    loadCount++;
    if (pendingLoad != null) return pendingLoad!.future;
    if (loadFailure) return Left(ServerFailure());
    return Right(List<Post>.unmodifiable(posts));
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    posts.add(Post(id: nextId++, title: post.title, body: post.body));
    return Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final index = posts.indexWhere((item) => item.id == post.id);
    if (index == -1) return Left(ServerFailure());
    posts[index] = post;
    return Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    deletedIds.add(id);
    posts.removeWhere((post) => post.id == id);
    return Right(unit);
  }
}

class FakeNetworkInfo implements NetworkInfo {
  const FakeNetworkInfo({required this.connected});

  final bool connected;

  @override
  Future<bool> get isConnected async => connected;
}

class FakeLocalDataSource implements PostLocalDataSource {
  const FakeLocalDataSource(this.posts);

  final List<Post> posts;

  @override
  Future<List<PostModel>> getCachPosts() async => posts
      .map((post) => PostModel(id: post.id, title: post.title, body: post.body))
      .toList();

  @override
  Future<Unit> cachPosts(List<PostModel> postModels) async => unit;
}

class FakeRemoteDataSource implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPosts() async => throw UnimplementedError();

  @override
  Future<Unit> addPost(PostModel postModel) async => throw UnimplementedError();

  @override
  Future<Unit> updatePost(PostModel postModel) async =>
      throw UnimplementedError();

  @override
  Future<Unit> deletePost(int postId) async => throw UnimplementedError();
}
