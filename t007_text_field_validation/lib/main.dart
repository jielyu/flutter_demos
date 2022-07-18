import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文字表单验证"),
      ),
      body: const TextSubmitWidget(),
    );
  }
}

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({Key? key}) : super(key: key);
  // final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  // declare a GlobalKey
  final _formKey = GlobalKey<FormState>();
  // declare a variable to keep track of the input text
  String _name = '';

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      // on success, notify the parent widget
      print('submit $_name succ');
      // widget.onSubmit(_name);
    } else {
      print('submit $_name fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    // build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter your name',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // use the validator to return an error string (or null) based on the input text
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Can\'t be empty';
              }
              if (text.length < 4) {
                return 'Too short';
              }
              return null;
            },
            // update the state variable when the text changes
            onChanged: (text) => setState(() => _name = text),
          ),
          ElevatedButton(
            // only enable the button if the text is not empty
            onPressed: _name.isNotEmpty ? _submit : null,
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
