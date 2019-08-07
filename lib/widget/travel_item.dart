import 'package:flutter/material.dart';
import 'package:flutter_trip/model/travel_item.dart';
///
/// Created by Maker on 2019/8/7.
/// Description:
/// 
class TravelItems extends StatelessWidget {
  final TravelItem item;
  final int index;
  const TravelItems({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(index.toString()),
    );
  }
}


