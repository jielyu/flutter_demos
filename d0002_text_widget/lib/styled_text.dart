import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class StyledTextPage extends StatefulWidget {
  const StyledTextPage({Key? key}) : super(key: key);

  @override
  _StyledTextPageState createState() => _StyledTextPageState();
}

class _StyledTextPageState extends State<StyledTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("风格化文本"),
      ),
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
              text: 'Test: <bold>bold</bold> text.',
              tags: {
                'bold': StyledTextTag(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.pink)),
              },
            ),
            StyledText(
              text: 'Text with alarm <alarm/> icon.',
              tags: {
                'alarm': StyledTextIconTag(Icons.alarm),
              },
            ),
            StyledText(
              text:
                  'Text with <link href="https://flutter.dev">link</link> inside.',
              tags: {
                'link': StyledTextActionTag(
                  (String? text, Map<String?, String?> attrs) {
                    final String link = attrs['href']!;
                    print('The "$link" link is tapped.');
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                'The $link link is tapped',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 24.0),
                              ),
                            ),
                          );
                        });
                  },
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
