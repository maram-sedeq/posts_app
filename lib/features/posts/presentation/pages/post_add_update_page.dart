import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../widgets/post_add_update_page/form_widget.dart';
import 'posts_page.dart';

class PostAddUpdatePage extends StatelessWidget {
  const new({super.key, this.post, required this.isUpdatePost});
  final Post? post;
  final bool isUpdatePost;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
       body: _buildBody()
       );
  }

  PreferredSizeWidget _buildAppbar() => AppBar(
    title: Text(
      isUpdatePost ? "Edit Post" : "Add Post",
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.pink[200],
  );

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackbarMessage().showSuccesSnackBar(
                message: state.message,
                context: context,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => PostsPage()),
                (route) => false,
              );
            } else if (state is ErrorAddDeleteUpdatePostState) {
              SnackbarMessage().showErrorSnackBar(
                message: state.message,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return LoadingWidget();
            }
            return FormWidget(
              isUpdatePost: isUpdatePost,
              post: isUpdatePost ? post : null,
            );
          },
        ),
      ),
    );
  }
}
