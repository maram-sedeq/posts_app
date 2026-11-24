import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/util/snackbar_message.dart';
import '../../../../../core/widget/loading_widget.dart';
import '../../pages/posts_page.dart';
import '../../providers/posts_notifier.dart';

class DeleteDialogWidget extends ConsumerWidget {
  const DeleteDialogWidget({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(postActionsProvider).isLoading) {
      return const AlertDialog(title: LoadingWidget());
    }

    return AlertDialog(
      title: const Text("Are You Sure?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () => _deletePost(context, ref),
          child: const Text("Yes"),
        ),
      ],
    );
  }

  Future<void> _deletePost(BuildContext context, WidgetRef ref) async {
    await ref.read(postActionsProvider.notifier).delete(postId);
    if (!context.mounted) return;

    final result = ref.read(postActionsProvider);
    if (result.hasError) {
      SnackbarMessage().showErrorSnackBar(
        message: postFailureMessage(result.error!),
        context: context,
      );
      Navigator.of(context).pop();
      return;
    }

    final message = result.value;
    if (message == null) return;

    SnackbarMessage().showSuccesSnackBar(message: message, context: context);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const PostsPage()),
      (route) => false,
    );
  }
}
