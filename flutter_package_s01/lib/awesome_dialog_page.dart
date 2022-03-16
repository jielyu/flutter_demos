import 'package:flutter/material.dart';

class AwesomeDialog extends StatefulWidget {
  const AwesomeDialog({Key? key}) : super(key: key);

  @override
  State<AwesomeDialog> createState() => _AwesomeDialogState();
}

class _AwesomeDialogState extends State<AwesomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("awesome dialog"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("对话框"),
      ),
    );
  }
}
