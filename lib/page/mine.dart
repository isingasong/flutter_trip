import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/widget/webview.dart';
///
/// Created by Maker on 2019/7/31.
/// Description:
/// 


class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(url: Api.MINE_URL,
      hideAppBar: true,
      backForbid: true,
      statusBarColor: "4c5bca",),
    );
  }
}
