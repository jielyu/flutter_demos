import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomBottomBar extends StatefulWidget {
  final BuildContext menuScreenContext;
  const CustomBottomBar({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
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
          const Text("样式: 定制"),
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
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: screens,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        hideNavigationBar: _hideNavBar,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        itemCount: navs.length,
        customWidget: CustomNavBarWidget(
          items: navs,
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
      ),
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      color: const Color.fromARGB(255, 247, 138, 174),
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeColorSecondary ?? item.activeColorPrimary)
                      : item.inactiveColorPrimary ?? item.activeColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title!,
                style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
