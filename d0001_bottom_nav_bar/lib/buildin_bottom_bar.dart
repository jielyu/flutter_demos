import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuildinBottomBar extends StatefulWidget {
  final BuildContext menuScreenContext;
  const BuildinBottomBar({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  _BuildinBottomBarState createState() => _BuildinBottomBarState();
}

class _BuildinBottomBarState extends State<BuildinBottomBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("内建"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text(
              "1",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text(
              "2",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text(
              "3",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.pink,
            child: const Text(
              "4",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.purple,
            child: const Text(
              "5",
              style: TextStyle(fontSize: 100),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index != 2) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
            _pageController.animateToPage(index,
                duration: const Duration(microseconds: 200),
                curve: Curves.easeIn);
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "主页",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "消息",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
                color: Colors.transparent,
              ),
              label: "编辑",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "榜单",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "设置",
              backgroundColor: Colors.grey),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
      ),
    );
  }
}

class MagicBottomBar extends StatefulWidget {
  final BuildContext menuScreenContext;
  const MagicBottomBar({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  _MagicBottomBarState createState() => _MagicBottomBarState();
}

class _MagicBottomBarState extends State<MagicBottomBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("内建"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          const HomePageBuildOnce(),
          const MessagePageBuildTimes(),
          // Container(
          //   alignment: Alignment.center,
          //   color: Colors.orange,
          //   child: const Text("3"),
          // ),
          Container(
            alignment: Alignment.center,
            color: Colors.pink,
            child: const Text(
              "3",
              style: TextStyle(fontSize: 100),
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.purple,
            child: const Text(
              "4",
              style: TextStyle(fontSize: 100),
            ),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: 0.8,
        child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 112, 130, 231),
            onPressed: () {},
            child: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 247, 93, 93),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              createNavItem(0, _currentIndex, Icons.home, Colors.white, "首页"),
              createNavItem(
                  1, _currentIndex, Icons.message, Colors.white, "消息"),
              createNavItem(-1, _currentIndex, Icons.home, Colors.white, ""),
              createNavItem(2, _currentIndex, Icons.person, Colors.white, "榜单"),
              createNavItem(
                  3, _currentIndex, Icons.settings, Colors.white, "设置"),
            ],
          ),
        ),
      ),
    );
  }

  Widget createNavItem(
      int id, int currentIndex, IconData icon, Color color, String label) {
    bool isHit = id == currentIndex;
    return GestureDetector(
        onTap: id < 0 ? null : () => onTap(id),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isHit ? Colors.orange : Colors.white,
              size: isHit ? 30 : 20,
            ),
            Text(label)
          ],
        ));
  }

  void onTap(int value) {
    _pageController.animateToPage(value,
        duration: const Duration(microseconds: 200), curve: Curves.easeIn);
  }
}

class HomePageBuildOnce extends StatefulWidget {
  const HomePageBuildOnce({Key? key}) : super(key: key);

  @override
  _HomePageBuildOnceState createState() => _HomePageBuildOnceState();
}

// 解决页面重复刷新的问题
class _HomePageBuildOnceState extends State<HomePageBuildOnce>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("build HomePageBuildOnce page");
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const Text(
        "1",
        style: TextStyle(fontSize: 100),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MessagePageBuildTimes extends StatefulWidget {
  const MessagePageBuildTimes({Key? key}) : super(key: key);

  @override
  _MessagePageBuildTimesState createState() => _MessagePageBuildTimesState();
}

// 存在重复创建的问题，与只创建一次的解决方案形成对比
class _MessagePageBuildTimesState extends State<MessagePageBuildTimes> {
  @override
  Widget build(BuildContext context) {
    print("build MessagePageBuildTimes page");
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text(
        "2",
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}
