/// 使用file_picker实现文件选择功能的案例
/// 可以在移动端和桌面端全平台使用

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  print('select file:${result.files.single.path!}');
                } else {
                  print('pick no file');
                }
              },
              child: const Text("文件选择"),
            ),
            TextButton(
              onPressed: () async {
                String? selectedDirectory =
                    await FilePicker.platform.getDirectoryPath();

                if (selectedDirectory == null) {
                  print('pick no dir');
                } else {
                  print('select dir:$selectedDirectory');
                }
              },
              child: const Text("目录选择"),
            ),
          ],
        ),
      ),
    );
  }
}
