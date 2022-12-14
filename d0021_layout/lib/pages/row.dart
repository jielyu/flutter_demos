import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RowLayoutDemo extends StatelessWidget {
  const RowLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("行布局"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("文字"),
            ElevatedButton(
              onPressed: () {},
              child: const Text("按钮"),
            ),
          ],
        ),
      ),
    );
  }
}
