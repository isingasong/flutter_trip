import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_trip/common/constant.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/dao/travel_dao.dart';
import 'package:flutter_trip/model/travel_item.dart';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:flutter_trip/widget/travel_item.dart';

///
/// Created by Maker on 2019/8/7.
/// Description:
///
class TravelTabs extends StatefulWidget {
  final String travelUrl;
  final String groupChannelCode;
  final Map params;

  const TravelTabs({Key key, this.travelUrl, this.groupChannelCode,this.params})
      : super(key: key);

  @override
  _TravelTabsState createState() => _TravelTabsState();
}

class _TravelTabsState extends State<TravelTabs> {
  List<TravelItem> _travelList;
  TravelModel _travelModel;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: _travelList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) => TravelItems(
          index: index,
          item: _travelList[index],
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
//        mainAxisSpacing: 4.0,
//        crossAxisSpacing: 4.0,
      ),
    );
  }

  void initData() async {
    _travelModel = await TravelDao.getTravelTabData(
      url: widget.travelUrl ?? Api.TRAVEL_TAB_URL,
        params:widget.params,
        groupChannelCode:widget.groupChannelCode,
        pageIndex:1,
        pageSize:Constant.PAGE_SIZE);
    List<TravelItem> items = filterItem(_travelModel.travelItems);
    if (_travelList != null) {
      _travelList.addAll(items);
    } else {
      _travelList = items;
    }
  }

  filterItem(List<TravelItem> list) {
    if (list == null) return [];
    List<TravelItem> filterItem = [];
    list.forEach((item) {
      if (item.article != null) {
        filterItem.add(item);
      }
    });
    return filterItem;
  }
}
