import 'package:flutter/material.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("image_picker"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("图片选择"),
      ),
    );
  }
}
