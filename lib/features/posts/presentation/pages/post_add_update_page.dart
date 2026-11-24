import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/core/app_theme.dart';

import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../providers/posts_notifier.dart';
import '../widgets/post_add_update_page/form_widget.dart';
import 'posts_page.dart';

class PostAddUpdatePage extends ConsumerWidget {
  const PostAddUpdatePage({super.key, this.post, required this.isUpdatePost});

  final Post? post;
  final bool isUpdatePost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(postActionsProvider, (previous, next) {
      next.when(
        data: (message) {
          if (message == null) return;
          SnackbarMessage().showSuccesSnackBar(
            message: message,
            context: context,
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const PostsPage()),
            (route) => false,
          );
        },
        error: (error, _) {
          SnackbarMessage().showErrorSnackBar(
            message: postFailureMessage(error),
            context: context,
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdatePost ? "Edit Post" : "Add Post",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ref.watch(postActionsProvider).isLoading
              ? const LoadingWidget()
              : FormWidget(
                  isUpdatePost: isUpdatePost,
                  post: isUpdatePost ? post : null,
                ),
        ),
      ),
    );
  }
}
