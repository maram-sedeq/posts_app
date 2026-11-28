import 'package:flutter/material.dart';

import '../../../../../core/app_theme.dart';
import 'delete_dialog_widget.dart';

class DeletePostBtnWidget extends StatelessWidget {
  const DeletePostBtnWidget({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (_) => DeleteDialogWidget(postId: postId),
      ),
      icon: const Icon(Icons.delete),
      label: const Text("Delete", style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(errorColor),
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    );
  }
}
