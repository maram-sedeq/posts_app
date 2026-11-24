import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';
import '../../pages/post_add_update_page.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  const new({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PostAddUpdatePage(isUpdatePost: true, post: post),
          ),
        );
      },
      icon: Icon(Icons.edit),
      label: Text("Edit", style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }
}
