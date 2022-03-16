import 'package:flutter/material.dart';

class FilePickerPage extends StatefulWidget {
  const FilePickerPage({Key? key}) : super(key: key);

  @override
  State<FilePickerPage> createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("file picker"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("文件选择"),
      ),
    );
  }
}
