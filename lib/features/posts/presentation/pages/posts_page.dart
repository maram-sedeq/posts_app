import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posts_app/core/app_theme.dart';

import '../../../../core/widget/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../providers/posts_notifier.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';
import 'post_add_update_page.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryColor,
      ),
      body: _buildBody(ref),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PostAddUpdatePage(isUpdatePost: false),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(WidgetRef ref) {
    final postsState = ref.watch(postsProvider);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: postsState.when(
        data: (List<Post> posts) => RefreshIndicator(
          onRefresh: () => ref.read(postsProvider.notifier).refresh(),
          child: PostListWidget(posts: posts),
        ),
        loading: () => const LoadingWidget(),
        error: (error, _) =>
            MessageDisplayWidget(message: postFailureMessage(error)),
      ),
    );
  }
}
