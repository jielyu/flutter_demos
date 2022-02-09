import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:async';

class GeneralBottomBar extends StatefulWidget {
  final BuildContext menuScreenContext;
  const GeneralBottomBar({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  _GeneralBottomBarState createState() => _GeneralBottomBarState();
}

class _GeneralBottomBarState extends State<GeneralBottomBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  int _styleIdx = 0;
  NavBarStyle _navStyle = NavBarStyle.values[0];
  late Timer _timer;
  static final List<int> _styleIdxArray = [
    0,
    1,
    2,
    //3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    // 14,
    // 15,
    // 16,
    // 17,
    18,
    19
  ];

  @override
  void initState() {
    super.initState();
    // 设置控制器
    _controller = PersistentTabController(initialIndex: 0);
    // 设置隐藏标志
    _hideNavBar = false;
    // 设置定时器
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _styleIdx = (_styleIdx + 1) % _styleIdxArray.length;
      _navStyle = NavBarStyle.values[_styleIdxArray[_styleIdx]];
      setState(() {});
      // ignore: avoid_print
      print("timeout " +
          DateTime.now().toString() +
          "idx:" +
          _styleIdx.toString() +
          ",style:" +
          _navStyle.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }

  Widget _createPage(Widget w) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(widget.menuScreenContext);
              },
              child: const Text("返回主窗体")),
          const SizedBox(
            height: 10,
          ),
          w,
          const SizedBox(
            height: 10,
          ),
          Text("样式:" + _navStyle.toString()),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // 显示和隐藏底部导航栏
                setState(() {
                  _hideNavBar = !_hideNavBar;
                });
              },
              child: Text(_hideNavBar ? "显示底Bar" : "隐藏底Bar")),
        ],
      ),
    );
  }

  List<Widget> _buildScreens() {
    return <Widget>[
      _createPage(const Text("主页")),
      _createPage(const Text("消息")),
      _createPage(const Text("榜单")),
      _createPage(const Text("设置")),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBars() {
    return <PersistentBottomNavBarItem>[
      PersistentBottomNavBarItem(title: "主页", icon: const Icon(Icons.home)),
      PersistentBottomNavBarItem(title: "消息", icon: const Icon(Icons.message)),
      PersistentBottomNavBarItem(title: "榜单", icon: const Icon(Icons.group)),
      PersistentBottomNavBarItem(title: "设置", icon: const Icon(Icons.settings)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screens = _buildScreens();
    final navs = _buildNavBars();
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: screens,
        items: navs,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: _navStyle,
      ),
    );
  }
}
