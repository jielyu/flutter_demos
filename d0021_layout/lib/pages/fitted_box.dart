import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FittedBoxLayoutDemo extends StatelessWidget {
  const FittedBoxLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FittedBox"),
      ),
      body: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        ),
      ),
    );
  }
}
