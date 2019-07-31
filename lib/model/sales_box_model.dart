import 'package:flutter_trip/model/common_model.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
/// 
class SalesBoxModel{
  CommonModel bigCard2;
  CommonModel smallCard4;
  CommonModel smallCard3;
  CommonModel bigCard1;
  CommonModel smallCard2;
  CommonModel smallCard1;
  String icon;
  String moreUrl;

  SalesBoxModel(
      {this.bigCard2,
        this.smallCard4,
        this.smallCard3,
        this.bigCard1,
        this.smallCard2,
        this.smallCard1,
        this.icon,
        this.moreUrl});

  SalesBoxModel.fromJson(Map<String, dynamic> json) {
    bigCard2 = json['bigCard2'] != null
        ? new CommonModel.fromJson(json['bigCard2'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new CommonModel.fromJson(json['smallCard4'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new CommonModel.fromJson(json['smallCard3'])
        : null;
    bigCard1 = json['bigCard1'] != null
        ? new CommonModel.fromJson(json['bigCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new CommonModel.fromJson(json['smallCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new CommonModel.fromJson(json['smallCard1'])
        : null;
    icon = json['icon'];
    moreUrl = json['moreUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    return data;
  }
}

