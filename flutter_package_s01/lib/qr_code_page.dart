import 'package:flutter/material.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("qr code"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("二维码"),
      ),
    );
  }
}
