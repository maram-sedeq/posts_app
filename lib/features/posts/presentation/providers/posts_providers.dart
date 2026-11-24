import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/network_info.dart';
import '../../data/datasources/post_local_data_source.dart';
import '../../data/datasources/post_remote_data_source.dart';
import '../../data/repositories/post_repository_impl.dart';
import '../../domain/repositories/posts_repository.dart';
import '../../domain/usecases/add_post.dart';
import '../../domain/usecases/delete_post.dart';
import '../../domain/usecases/get_all_posts.dart';
import '../../domain/usecases/update_post.dart';

part 'posts_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'Override sharedPreferencesProvider in ProviderScope before runApp.',
  );
}

@riverpod
http.Client httpClient(Ref ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return client;
}

@riverpod
InternetConnectionChecker internetConnectionChecker(Ref ref) {
  return InternetConnectionChecker.createInstance();
}

@riverpod
NetworkInfo networkInfo(Ref ref) {
  return NetworkInfoImpl(
    connectionChecker: ref.watch(internetConnectionCheckerProvider),
  );
}

@riverpod
PostRemoteDataSource postRemoteDataSource(Ref ref) {
  return PostRemoteDataSourceImpl(client: ref.watch(httpClientProvider));
}

@riverpod
PostLocalDataSource postLocalDataSource(Ref ref) {
  return PostLocalDataSourceImpl(
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  );
}

@riverpod
PostsRepository postsRepository(Ref ref) {
  return PostRepositoryImpl(
    remoteDataSource: ref.watch(postRemoteDataSourceProvider),
    localDataSource: ref.watch(postLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
}

@riverpod
GetAllPostsUsecase getAllPostsUsecase(Ref ref) {
  return GetAllPostsUsecase(repository: ref.watch(postsRepositoryProvider));
}

@riverpod
AddPostUsecase addPostUsecase(Ref ref) {
  return AddPostUsecase(repository: ref.watch(postsRepositoryProvider));
}

@riverpod
UpdatePostUsecase updatePostUsecase(Ref ref) {
  return UpdatePostUsecase(repository: ref.watch(postsRepositoryProvider));
}

@riverpod
DeletePostUsecase deletePostUsecase(Ref ref) {
  return DeletePostUsecase(repository: ref.watch(postsRepositoryProvider));
}
