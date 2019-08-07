import 'package:flutter_trip/model/travel_tab.dart';

///
/// Created by Maker on 2019/8/7.
/// Description:
/// 
class TravelTabModel{
  Map params;
  String url;
  List<TravelTab> tabs;

  @override
  String toString() {
    return 'TravelTabModel{params: $params, url: $url, tabs: $tabs}';
  }

  TravelTabModel({this.url, this.tabs});

  TravelTabModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    params = json['params'];
    if (json['tabs'] != null) {
      tabs = new List<TravelTab>();
      json['tabs'].forEach((v) {
        tabs.add(new TravelTab.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    if (this.tabs != null) {
      data['tabs'] = this.tabs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

