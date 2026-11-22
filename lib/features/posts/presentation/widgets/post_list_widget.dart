import 'package:flutter/material.dart';
import 'package:posts_app/features/posts/domain/entities/post.dart';

class PostListWidget extends StatelessWidget {
  const new({super.key, required this.posts});

  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(posts[index].id.toString()),
          title: Text(
            posts[index].title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(posts[index].body, style: TextStyle(fontSize: 16)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) {
        return Divider(thickness: 1);
      },
      itemCount: posts.length,
    );
  }
}
