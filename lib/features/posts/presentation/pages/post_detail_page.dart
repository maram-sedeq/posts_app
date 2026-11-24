import 'package:flutter/material.dart';
import 'package:posts_app/core/app_theme.dart';

import '../../domain/entities/post.dart';
import '../widgets/post_detail_page/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  const new({super.key, required this.post});
final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }
  
  AppBar _buildAppbar(){
   return AppBar(
    title: Text("Post Details", style: TextStyle(color: secondaryColor)),
    backgroundColor: primaryColor
    ,);
  }

  Widget _buildBody(){
 return Center(
  child: Padding(padding: const EdgeInsets.all(10),
  child: PostDetailWidget(post:post),
 ),);
  
  }
}