import 'package:flutter/material.dart';
import 'package:flutter_trip/page/home.dart';
import 'package:flutter_trip/page/mine.dart';
import 'package:flutter_trip/page/search.dart';
import 'package:flutter_trip/page/travel.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Home(),
          Search(
            hideLeft: true,
          ),
          Travel(),
          Mine(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            _bottomNavigationBarItem(Icons.home, "首页", 0),
            _bottomNavigationBarItem(Icons.search, "搜索", 1),
            _bottomNavigationBarItem(Icons.camera, "旅拍", 2),
            _bottomNavigationBarItem(Icons.account_circle, "我的", 3),
          ]),
    );
  }

  _bottomNavigationBarItem(IconData icon, String title, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex == index ? _activeColor : _defaultColor),
        ));
  }
}
