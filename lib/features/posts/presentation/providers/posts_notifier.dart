import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/strings/failures.dart';
import '../../../../core/strings/messages.dart';
import '../../domain/entities/post.dart';
import 'posts_providers.dart';

part 'posts_notifier.g.dart';

Duration? _doNotRetry(int retryCount, Object error) => null;

@Riverpod(retry: _doNotRetry)
class Posts extends _$Posts {
  @override
  Future<List<Post>> build() async {
    final getAllPosts = ref.watch(getAllPostsUsecaseProvider);
    final result = await getAllPosts();
    return result.fold((failure) => throw failure, (posts) => posts);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(getAllPostsUsecaseProvider)();
      return result.fold((failure) => throw failure, (posts) => posts);
    });
  }
}

@Riverpod(keepAlive: true)
class PostActions extends _$PostActions {
  @override
  AsyncValue<String?> build() => const AsyncData(null);

  Future<void> add(Post post) =>
      _run(() => ref.read(addPostUsecaseProvider)(post), ADD_SUCCESS_MESSAGE);

  Future<void> update(Post post) => _run(
    () => ref.read(updatePostUsecaseProvider)(post),
    UPDATE_SUCCESS_MESSAGE,
  );

  Future<void> delete(int postId) => _run(
    () => ref.read(deletePostUsecaseProvider)(postId),
    DELETE_SUCCESS_MESSAGE,
  );

  Future<void> _run(
    Future<Either<Failure, Unit>> Function() action,
    String successMessage,
  ) async {
    state = const AsyncLoading();

    try {
      final result = await action();
      result.fold(
        (failure) {
          state = AsyncError(failure, StackTrace.current);
        },
        (_) {
          state = AsyncData(successMessage);
          ref.invalidate(postsProvider);
        },
      );
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

String postFailureMessage(Object error) {
  if (error is ServerFailure) return SERVER_FAILURE_MESSAGE;
  if (error is EmptyCachFailure) return EMPTY_CACHE_FAILURE_MESSAGE;
  if (error is offLineFailure) return OFFLINE_FAILURE_MESSAGE;
  return 'Unexpected error. Please try again.';
}
