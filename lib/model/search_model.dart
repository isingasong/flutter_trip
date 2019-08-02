import 'package:flutter_trip/model/search_item.dart';

///
/// Created by Maker on 2019/8/2.
/// Description:
///

class SearchModel {
  String keyWord;
  List<SearchItem> data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json["data"] as List;
    List<SearchItem> mData =
        dataJson.map((item) => SearchItem.fromJson(item)).toList();
    data = mData;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["data"] = this.data;
    return data;
  }
}
