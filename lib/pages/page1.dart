import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String? title;
  const PageOne({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello, $title")),
      body: const Text("This is also a sample page"),
    );
  }
}
