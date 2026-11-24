import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post.dart';
import '../../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../text_from_field_widget.dart';
import 'form_submit_btn.dart';

class FormWidget extends StatefulWidget {
  const new({super.key, required this.isUpdatePost, this.post});
  final bool isUpdatePost;
  final Post? post;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _textController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFromFieldWidget(
            name: "Title",
            multiLines: false,
            controller: _textController,
          ),
          TextFromFieldWidget(
            name: "Body",
            multiLines: false,
            controller: _bodyController,
          ),
          
          FormSubmitBtn(isUpdatePost:widget.isUpdatePost, onPressed: validateFromThenUpdateOrAddPost),
         
          
        ],
      ),
    );
  }
   void validateFromThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final post = Post(
        id: widget.isUpdatePost ? widget.post!.id : null,
        title: _textController.text,
        body: _bodyController.text,
      );

      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }
}
