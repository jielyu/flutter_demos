import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'buildin_bottom_bar.dart';
import 'general_bottom_bar.dart';
import 'custom_bottom_bar.dart';
import 'special_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "底部导航栏",
      home: MainHome(),
    );
  }
}

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicked");
              pushNewScreen(
                context,
                screen: GeneralBottomBar(menuScreenContext: context),
              );
            },
            child: const Text("一般Bottom Bar")),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicked");
              pushNewScreen(
                context,
                screen: CustomBottomBar(menuScreenContext: context),
              );
            },
            child: const Text("定制Bottom Bar")),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicked");
              pushNewScreen(
                context,
                screen: SpecialBottomBar(menuScreenContext: context),
              );
            },
            child: const Text("特别的Bottom Bar")),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicked");
              pushNewScreen(
                context,
                screen: BuildinBottomBar(menuScreenContext: context),
              );
            },
            child: const Text("内建的Bottom Bar")),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              // ignore: avoid_print
              print("clicked");
              pushNewScreen(
                context,
                screen: MagicBottomBar(menuScreenContext: context),
              );
            },
            child: const Text("神奇的Bottom Bar")),
      ],
    );
  }
}
