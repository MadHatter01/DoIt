import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title:  Text("Page: $arg")),
      body: Column(children: [
        TextButton(onPressed: (){
          Navigator.of(context).pop("pass custom message to main");
        }, child: const Text("custom message")),
const Text("This is a sample page"),
      ],) 
    );
  }
}