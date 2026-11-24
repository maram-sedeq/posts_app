import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

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
  Future<List<PostModel>> getCachPosts() async {
   final jsonString = sharedPreferences.getString(CACHED_POSTS);
   if(jsonString != null){
      try {
        final List decodeJsonData = json.decode(jsonString);
        final List<PostModel> jsonToPostsModels = decodeJsonData
            .map<PostModel>((jsonPostModel)=> PostModel.fromJson(jsonPostModel))
            .toList();
        return jsonToPostsModels;
      } on FormatException {
        // Older cached entries may have null IDs because they were saved
        // before PostModel forwarded the ID to its parent entity.
        throw EmptyCachException();
      }
       }
       else{
        throw EmptyCachException();
       }
  }
  
} 
