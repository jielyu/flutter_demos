import 'package:d0003_route/animation_page.dart';
import 'package:d0003_route/navigator_page.dart';
import 'package:d0003_route/route_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("页面跳转Demos"),
      ),
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RoutePage()));
                },
                child: const Text("路由链接")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NavigatorPage()));
                },
                child: const Text("Navigator")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AnimationPage()));
                },
                child: const Text("跳转动画")),
          ],
        ),
      ),
    );
  }
}
