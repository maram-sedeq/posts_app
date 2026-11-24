import 'package:flutter/material.dart';

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
    title: Text("Post Detail", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.pink[200]
    ,);
  }

  Widget _buildBody(){
 return Center(
  child: Padding(padding: const EdgeInsets.all(10),
  child: PostDetailWidget(post:post),
 ),);
  
  }
}