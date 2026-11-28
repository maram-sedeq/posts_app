import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';
import 'post_api_service.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final PostApiService apiService;

  PostRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      final response = await apiService.getAllPosts();
      if (response.response.statusCode == 200) {
        return response.data;
      }
      throw ServerException();
    } on DioException {
      throw ServerException();
    } on FormatException {
      throw ServerException();
    } on TypeError {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    try {
      final response = await apiService.addPost({
        'title': postModel.title,
        'body': postModel.body,
      });
      if (response.response.statusCode == 201) {
        return unit;
      }
      throw ServerException();
    } on DioException {
      throw ServerException();
    } on FormatException {
      throw ServerException();
    } on TypeError {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    try {
      final response = await apiService.deletePost(postId);
      if (response.response.statusCode == 200) {
        return unit;
      }
      throw ServerException();
    } on DioException {
      throw ServerException();
    } on FormatException {
      throw ServerException();
    } on TypeError {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id;
    if (postId == null) {
      throw ServerException();
    }

    try {
      final response = await apiService.updatePost(postId, {
        'title': postModel.title,
        'body': postModel.body,
      });
      if (response.response.statusCode == 200) {
        return unit;
      }
      throw ServerException();
    } on DioException {
      throw ServerException();
    } on FormatException {
      throw ServerException();
    } on TypeError {
      throw ServerException();
    }
  }
}
