import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/post_model.dart';

part 'post_api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostApiService {
  factory PostApiService(Dio dio, {String? baseUrl}) = _PostApiService;

  @GET('/posts')
  Future<HttpResponse<List<PostModel>>> getAllPosts();

  @GET('/posts/{id}')
  Future<HttpResponse<PostModel>> getPost(@Path('id') int id);

  @POST('/posts')
  Future<HttpResponse<dynamic>> addPost(@Body() Map<String, dynamic> body);

  @PUT('/posts/{id}')
  Future<HttpResponse<dynamic>> updatePost(
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/posts/{id}')
  Future<HttpResponse<dynamic>> deletePost(@Path('id') int id);
}
