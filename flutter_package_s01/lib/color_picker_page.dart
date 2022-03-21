/// 使用flutter_colorpicker实现颜色拾取功能的案例
/// 可以在移动端和桌面端全平台使用

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

enum PickerType {
  colorPickerType,
  materialPickerType,
  blockPickerType,
  slidePickerType,
  // multipleChoiceBlockPickerType,
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void onShowDialog(PickerType pickerType) {
    Widget picker = Container();
    switch (pickerType) {
      case PickerType.colorPickerType:
        picker = ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        );
        break;
      case PickerType.materialPickerType:
        picker = MaterialPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        );
        break;
      case PickerType.blockPickerType:
        picker = BlockPicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        );
        break;
      // case PickerType.multipleChoiceBlockPickerType:
      // picker = MultipleChoiceBlockPicker(
      //     pickerColor: pickerColor,
      //     onColorChanged: changeColor,
      //   );
      //   break;
      case PickerType.slidePickerType:
        picker = SlidePicker(
          pickerColor: pickerColor,
          onColorChanged: changeColor,
        );
        break;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择颜色'),
        content: SingleChildScrollView(
          child: picker,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('确定'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("color picker"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                onShowDialog(PickerType.colorPickerType);
              },
              child: Text(
                "调色板",
                style: TextStyle(color: currentColor),
              ),
            ),
            TextButton(
              onPressed: () {
                onShowDialog(PickerType.blockPickerType);
              },
              child: Text(
                "颜色标签",
                style: TextStyle(color: currentColor),
              ),
            ),
            TextButton(
              onPressed: () {
                onShowDialog(PickerType.materialPickerType);
              },
              child: Text(
                "物料颜色",
                style: TextStyle(color: currentColor),
              ),
            ),
            TextButton(
              onPressed: () {
                onShowDialog(PickerType.slidePickerType);
              },
              child: Text(
                "滑块调色",
                style: TextStyle(color: currentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
