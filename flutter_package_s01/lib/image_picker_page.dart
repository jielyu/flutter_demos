import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("image_picker"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("照片"),
              onTap: () async {
                try {
                  final List<XFile>? pickedFileList =
                      await _picker.pickMultiImage(
                    maxWidth: 19200,
                    maxHeight: 10800,
                    imageQuality: 100,
                  );
                  if (pickedFileList != null) {
                    print(pickedFileList.length);
                    for (var i in pickedFileList) {
                      print(i.path);
                    }
                  } else {
                    print("empty");
                  }
                } catch (e) {
                  print("exception: $e");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
