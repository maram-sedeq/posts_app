import 'package:flutter/material.dart';

class FormSubmitBtn extends StatelessWidget {
  const new({super.key, required this.onPressed, required this.isUpdatePost});
  final void Function() onPressed;
  final bool isUpdatePost;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.pink[400]),
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
      icon: isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
      label: Text(
        isUpdatePost ? "Update" : "Add",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
