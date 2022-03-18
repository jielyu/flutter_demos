import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'webview_flutter_page_android.dart';
import 'webview_flutter_page_ios.dart';
import 'utils.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    print("build webview android page");
    return Scaffold(
      appBar: AppBar(
        title: const Text("webview_flutter"),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text("GO"))
          // IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right_alt))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                const String tmpUrl = 'https://baidu.com';
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                            create: (_) => WebStatusNotifier()),
                      ],
                      child: Platform.isAndroid
                          ? WebViewCustomAndroidPage(tmpUrl)
                          : WebviewCustomIOSPage(tmpUrl),
                    ),
                  ),
                );
              },
              child: const Text("百度"),
            ),
            TextButton(
              onPressed: () {
                const String tmpUrl = 'https://flutter.cn';
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                          create: (_) => WebStatusNotifier()),
                    ],
                    child: Platform.isAndroid
                        ? WebViewCustomAndroidPage(tmpUrl)
                        : WebviewCustomIOSPage(tmpUrl),
                  ),
                ));
              },
              child: const Text("flutter"),
            ),
          ],
        ),
      ),
    );
  }
}
