import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/travel_dao.dart';
import 'package:flutter_trip/model/travel_tab.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:flutter_trip/page/travek_tab.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> with TickerProviderStateMixin {
  TabController _tabController;
  List<TravelTab> _tabs = [];
  TravelTabModel _model;

  @override
  void initState() {
    _tabController = TabController(length: 0, vsync: this);
    initData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 24.0),
            child: TabBar(
              tabs: _tabs.map<Tab>((TravelTab tab) {
                return Tab(text: tab.labelName);
              }).toList(),
              controller: _tabController,
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.0),
              labelPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.blue, width: 4.0),
                insets: EdgeInsets.only(bottom: 10.0),
              ),
            ),
          ),
          Flexible(
              child: TabBarView(
                controller: _tabController,
                  children: _tabs.map((TravelTab tab) {
            return TravelTabs(travelUrl: _model.url,groupChannelCode:tab.groupChannelCode,params: _model.params,);
          }).toList())),
        ],
      ),
    );
  }

  void initData() async {
    _model = await TravelDao.getTravelData();
    _tabs = _model.tabs;
    _tabController = TabController(length: _tabs.length, vsync: this);
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
