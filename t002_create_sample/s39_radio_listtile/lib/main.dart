import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              }),
          RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isRadioSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinkedLabelRadio(
            label: 'First tappable label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: true,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
              });
            },
          ),
          LinkedLabelRadio(
            label: 'Second tappable label text',
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            value: false,
            groupValue: _isRadioSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isRadioSelected = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
