import 'package:flutter/material.dart';

class MessageDisplayWidget extends StatelessWidget {
  const new({super.key, required this.message});
final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(child: SingleChildScrollView(
        child: Text(message,
        style: TextStyle(fontSize: 25),
        textAlign: TextAlign.center,),
      ),),
    );
  }
}