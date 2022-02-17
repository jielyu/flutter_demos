import 'package:d0002_text_widget/auto_size_text.dart';
import 'package:d0002_text_widget/general_text.dart';
import 'package:d0002_text_widget/math_text.dart';
import 'package:d0002_text_widget/rich_text.dart';
import 'package:d0002_text_widget/styled_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter的文本Demos"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const GeneralTextPage()));
              },
              child: const Text(
                "Text",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RichTextPage()));
              },
              child: const Text(
                "Rich Text",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AutoSizeTextPage()));
              },
              child: const Text(
                "Auto Size Text",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StyledTextPage()));
              },
              child: const Text(
                "Styled Text",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.cyan),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MathTextPage()));
              },
              child: const Text(
                "Math Text",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }
}
