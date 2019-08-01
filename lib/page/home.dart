import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/banner_model.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_item_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/widget/banner_widget.dart';
import 'package:flutter_trip/widget/grid_nav.dart';
import 'package:flutter_trip/widget/local_nav.dart';
import 'package:flutter_trip/widget/sales_box.dart';
import 'package:flutter_trip/widget/sub_nav.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const scrollDistance = 80.0;
  List<CommonModel> localNavList = [];
  List<BannerModel> bannerList = [];
  GridNavModel gridNavModel;
  List<CommonModel> subNavList;
  SalesBoxModel salesBox;
  HomeModel homeModel;

  double distance = 0.0;
  double opacity = 0.0;

  void scroll(ScrollNotification scrollNotification) {
    distance = scrollNotification.metrics.pixels;
    double alpha = distance / scrollDistance;
    if (alpha <= 0) {
      alpha = 0;
    } else if (alpha >= 1) {
      alpha = 1;
    }
    opacity = alpha;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  loadHomeData() async {
    try {
      homeModel = await HomeDao.getHomeData();
      setState(() {
        bannerList = homeModel.bannerList;
        localNavList = homeModel.localNavList;
        gridNavModel = homeModel.gridNav;
        subNavList = homeModel.subNavList;
        salesBox = homeModel.salesBox;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
        body: Stack(
      children: <Widget>[
        body,
        appBar,
      ],
    ));
  }

  Widget get body {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                scroll(scrollNotification);
              }
            },
            child: ListView(
              children: <Widget>[
                BannerWidget(bannerList: bannerList),
                LocalNav(localNavList: localNavList),
                GridNav(gridNavModel: gridNavModel),
                SubNav(subNavList: subNavList,),
                SalesBox(salesBox:salesBox),

              ],
            )));
  }


  Widget get appBar {
    return Opacity(
      opacity: opacity,
      child: Container(
        height: 76.0,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 23.0),
            child: Text("Home"),
          ),
        ),
      ),
    );
  }
}
