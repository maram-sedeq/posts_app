import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/post.dart';
import '../../providers/posts_notifier.dart';
import '../text_from_field_widget.dart';
import 'form_submit_btn.dart';

class FormWidget extends ConsumerStatefulWidget {
  const FormWidget({super.key, required this.isUpdatePost, this.post});

  final bool isUpdatePost;
  final Post? post;

  @override
  ConsumerState<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends ConsumerState<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdatePost) {
      _textController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _bodyController.dispose();
    super.dispose();
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
          FormSubmitBtn(isUpdatePost: widget.isUpdatePost, onPressed: _submit),
        ],
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final post = Post(
      id: widget.isUpdatePost ? widget.post!.id : null,
      title: _textController.text,
      body: _bodyController.text,
    );

    final actions = ref.read(postActionsProvider.notifier);
    if (widget.isUpdatePost) {
      actions.update(post);
    } else {
      actions.add(post);
    }
  }
}
