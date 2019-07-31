import 'package:flutter_trip/model/banner_model.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel {
  List<BannerModel> bannerList;
  List<CommonModel> subNavList;
  List<CommonModel> localNavList;
  SalesBoxModel salesBox;
  ConfigModel config;
  GridNavModel gridNav;

  HomeModel(
      {this.bannerList,
      this.subNavList,
      this.localNavList,
      this.salesBox,
      this.config,
      this.gridNav});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['bannerList'] != null) {
      bannerList = new List<BannerModel>();
      (json['bannerList'] as List).forEach((v) {
        bannerList.add(new BannerModel.fromJson(v));
      });
    }
    if (json['subNavList'] != null) {
      subNavList = new List<CommonModel>();
      (json['subNavList'] as List).forEach((v) {
        subNavList.add(new CommonModel.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = new List<CommonModel>();
      (json['localNavList'] as List).forEach((v) {
        localNavList.add(new CommonModel.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBoxModel.fromJson(json['salesBox'])
        : null;
    config = json['config'] != null
        ? new ConfigModel.fromJson(json['config'])
        : null;
    gridNav = json['gridNav'] != null
        ? new GridNavModel.fromJson(json['gridNav'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }
    return data;
  }
}
