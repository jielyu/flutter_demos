import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SizedBoxLayoutDemo extends StatelessWidget {
  const SizedBoxLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SizedBox"),
      ),
      body: const SizedBox(
        width: 200.0,
        height: 300.0,
        child: Card(child: Text('Hello World!')),
      ),
    );
  }
}
