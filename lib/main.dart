import 'package:flutter/material.dart';
import 'package:posts_app/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Psts App',
      home: Scaffold(
        appBar: AppBar(title: Text("Posts")),
        body: Center(child: Text("Hello World")),
      ),
    );
  }
}
