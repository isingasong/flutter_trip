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
        children: <Widget>[
          Home(),
          Search(),
          Travel(),
          Mine(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: _activeColor,
                ),
                title: Text(
                  "首页",
                  style: TextStyle(
                      color: _currentIndex == 0 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: _activeColor,
                ),
                title: Text(
                  "搜索",
                  style: TextStyle(
                      color: _currentIndex == 1 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.camera,
                  color: _activeColor,
                ),
                title: Text(
                  "旅拍",
                  style: TextStyle(
                      color: _currentIndex == 2 ? _activeColor : _defaultColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: _activeColor,
                ),
                title: Text(
                  "我的",
                  style: TextStyle(
                      color: _currentIndex == 3 ? _activeColor : _defaultColor),
                )),
          ]),
    );
  }
}
