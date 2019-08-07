import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_trip/common/constant.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/dao/travel_dao.dart';
import 'package:flutter_trip/model/travel_item.dart';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:flutter_trip/widget/loading_container.dart';
import 'package:flutter_trip/widget/travel_item.dart';

///
/// Created by Maker on 2019/8/7.
/// Description:
///
class TravelTabs extends StatefulWidget {
  final String travelUrl;
  final String groupChannelCode;
  final Map params;

  const TravelTabs(
      {Key key, this.travelUrl, this.groupChannelCode, this.params})
      : super(key: key);

  @override
  _TravelTabsState createState() => _TravelTabsState();
}

class _TravelTabsState extends State<TravelTabs>
    with AutomaticKeepAliveClientMixin {
  List<TravelItem> _travelList;
  TravelModel _travelModel;
  bool _loading = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    initData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        initData(loadingMore: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: LoadingContainer(
        isLoading: _loading,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: StaggeredGridView.countBuilder(
              controller: _scrollController,
              crossAxisCount: 4,
              itemCount: _travelList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) => TravelItems(
                index: index,
                item: _travelList[index],
              ),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            ),
          ),
        ),
      ),
    );
  }

  void initData({loadingMore = false}) async {
    if (loadingMore) {
      Constant.PAGE_INDEX++;
    } else {
      Constant.PAGE_INDEX = 1;
    }
    _travelModel = await TravelDao.getTravelTabData(
        url: widget.travelUrl ?? Api.TRAVEL_TAB_URL,
        params: widget.params,
        groupChannelCode: widget.groupChannelCode,
        pageIndex: Constant.PAGE_INDEX,
        pageSize: Constant.PAGE_SIZE);
    _loading = false;
    List<TravelItem> items = filterItem(_travelModel.travelItems);
    if (_travelList != null) {
      _travelList.addAll(items);
    } else {
      _travelList = items;
    }
    setState(() {});
  }

  List<TravelItem> filterItem(List<TravelItem> list) {
    if (list == null) return [];
    List<TravelItem> filterItem = [];
    list.forEach((item) {
      if (item.article != null) {
        filterItem.add(item);
      }
    });
    return filterItem;
  }

  @override
  bool get wantKeepAlive => true;

  Future<Null> _onRefresh() async {
    initData();
    return null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
