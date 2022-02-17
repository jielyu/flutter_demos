import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("跳转动画"),
      ),
      body: Container(
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(animatePage(AnimationTestPage("从底部载入")));
              },
              child: const Text("从底部进入"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(animatePage(
                    AnimationTestPage("从顶部载入"),
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0)));
              },
              child: const Text("从顶部载入"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(animatePage(
                    AnimationTestPage("从左侧载入"),
                    begin: const Offset(-1.0, 0.0),
                    end: const Offset(0.0, 0.0)));
              },
              child: const Text("从左侧载入"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(animatePage(
                    AnimationTestPage("从右载入"),
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0)));
              },
              child: const Text("从右载入"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(animatePage(
                    AnimationTestPage("从左上载入"),
                    begin: const Offset(-1.0, -1.0),
                    end: const Offset(0.0, 0.0)));
              },
              child: const Text("从左上载入"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(animatePage(
                    AnimationTestPage("从右上载入"),
                    begin: const Offset(1.0, -1.0),
                    end: const Offset(0.0, 0.0)));
              },
              child: const Text("从右上载入"),
            ),
          ],
        ),
      ),
    );
  }
}

Route animatePage(Widget widget,
    {Offset? begin = const Offset(0.0, 1.0), Offset? end = Offset.zero}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.ease;

      Animatable<Offset> tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class AnimationTestPage extends StatelessWidget {
  String tag = "说明动画载入方向";
  AnimationTestPage(this.tag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tag),
      ),
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(tag),
      ),
    );
  }
}
