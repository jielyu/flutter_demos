import 'package:flutter/material.dart';

class SqflitePage extends StatefulWidget {
  const SqflitePage({Key? key}) : super(key: key);

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("sqflite"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("sqflite"),
      ),
    );
  }
}
