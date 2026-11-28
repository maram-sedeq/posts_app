import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post_api_service.dart';
import 'post_remote_data_source.dart';

const _baseUrl = 'https://jsonplaceholder.typicode.com';

final _postDioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));
  ref.onDispose(() => dio.close(force: true));
  return dio;
});

final _postApiServiceProvider = Provider<PostApiService>((ref) {
  return PostApiService(ref.watch(_postDioProvider), baseUrl: _baseUrl);
});

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  return PostRemoteDataSourceImpl(
    apiService: ref.watch(_postApiServiceProvider),
  );
});
