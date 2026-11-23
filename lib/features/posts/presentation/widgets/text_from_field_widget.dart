import 'package:flutter/material.dart';

class TextFromFieldWidget extends StatelessWidget {
  const new({super.key, required this.controller, required this.multiLines, required this.name});

final TextEditingController controller;
final bool multiLines;
final String name;


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: TextFormField(
              minLines: multiLines ? 6 : 1,
              maxLines: multiLines ? 6 : 1,
              controller: controller,
              validator: (value) =>
                  value!.isEmpty ? "$name Can't be empty" : null,
              decoration: InputDecoration(hintText: name),
            ),
          );
  }
}