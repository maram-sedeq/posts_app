import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/exceptions.dart';
import 'package:posts_app/features/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachPosts();
  Future<Unit> cachPosts(List<PostModel> postModels);
}
const CACHED_POSTS = "CACHED_POSTS";

class PostLocalDataSourceImpl implements PostLocalDataSource{
  final SharedPreferences sharedPreferences;

  new({required this.sharedPreferences});
  
  @override

  Future<Unit> cachPosts(List<PostModel> postModels) {
   List postModelsToJson = postModels
   .map<Map<String,dynamic>>((postModel) => postModel.toJson())
   .toList(); 
   sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
   return Future.value(unit); 
   }
  
  @override
  Future<List<PostModel>> getCachPosts() {
   final jsonString = sharedPreferences.getString(CACHED_POSTS);
   if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostsModels = decodeJsonData
          .map<PostModel>((jsonPostModel)=> PostModel.fromJson(jsonPostModel))
          .toList();
        return Future.value(jsonToPostsModels);
       }
       else{
        throw EmptyCachException();
       }
  }
  
} 