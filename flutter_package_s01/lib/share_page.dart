import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("share"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("分享页"),
      ),
    );
  }
}
