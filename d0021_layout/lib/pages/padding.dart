import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaddingLayoutDemo extends StatelessWidget {
  const PaddingLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Padding"),
      ),
      body: const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
