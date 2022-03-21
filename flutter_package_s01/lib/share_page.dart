/// 使用flutter_share实现信息分享的案例
/// 仅支持在移动端使用

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("share"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(onPressed: share, child: const Text("分享")),
      ),
    );
  }
}
