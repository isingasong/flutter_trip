import 'package:flutter/material.dart';
import 'package:flutter_trip/widget/search_bar.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: ListView(children: <Widget>[
          SearchBar(
            hideLeft: true,
            defaultText: "搜索",
            hint: "请输入搜索内容",
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChanged,
          ),
        ]));
  }

  void _onTextChanged(String value) {}
}
