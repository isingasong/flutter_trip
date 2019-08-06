import 'package:flutter_trip/model/travel_item.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
/// 
class TravelModel {
  int totalCount;
  List<TravelItem> travelItems;

  TravelModel({this.totalCount, this.travelItems});

  TravelModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['resultList'] != null) {
      travelItems = new List<TravelItem>();
      json['resultList'].forEach((v) {
        travelItems.add(new TravelItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.travelItems != null) {
      data['resultList'] = this.travelItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

