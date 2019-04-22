import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/icon_font.dart';
import 'home_page.dart';
import 'hierarchy_page.dart';
import 'navigation_page.dart';
import 'wx_artical_page.dart';
import 'project_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _items = [];

  final List<Widget> _contnetList = [
    HomePage(),
    HierarchyPage(),
    NavigationPage(),
    WxArticalPage(),
    ProjectPage()
  ];

  @override
  void initState() {
    _items
      ..add(_bottomNavigationBarItem(IconFont.home, '首页'))
      ..add(_bottomNavigationBarItem(IconFont.hierarchy, '体系'))
      ..add(_bottomNavigationBarItem(IconFont.navigation, '导航'))
      ..add(_bottomNavigationBarItem(IconFont.wx_artical, '公众号'))
      ..add(_bottomNavigationBarItem(IconFont.project, '项目'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contnetList[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData iconData, String title) {
    return BottomNavigationBarItem(icon: Icon(iconData), title: Text(title));
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: _items,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
