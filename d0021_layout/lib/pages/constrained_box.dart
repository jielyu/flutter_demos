import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConstrainedBoxLayoutDemo extends StatelessWidget {
  const ConstrainedBoxLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConstrainedBox"),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: const Card(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
