import 'package:flutter_trip/model/grid_nav_item_model.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
/// 
class GridNavModel{
  GridNavItemModel flight;
  GridNavItemModel hotel;
  GridNavItemModel travel;

  GridNavModel({this.flight, this.hotel, this.travel});

  GridNavModel.fromJson(Map<String, dynamic> json) {
    flight = json['flight'] != null
        ? new GridNavItemModel.fromJson(json['flight'])
        : null;
    hotel = json['hotel'] != null
        ? new GridNavItemModel.fromJson(json['hotel'])
        : null;
    travel = json['travel'] != null
        ? new GridNavItemModel.fromJson(json['travel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }
    return data;
  }
}

