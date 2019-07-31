import 'package:flutter_trip/model/common_model.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class GridNavItemModel {
  CommonModel item2;
  CommonModel item1;
  String endColor;
  CommonModel mainItem;
  CommonModel item4;
  CommonModel item3;
  String startColor;

  GridNavItemModel(
      {this.item2,
      this.item1,
      this.endColor,
      this.mainItem,
      this.item4,
      this.item3,
      this.startColor});

  GridNavItemModel.fromJson(Map<String, dynamic> json) {
    item2 =
        json['item2'] != null ? new CommonModel.fromJson(json['item2']) : null;
    item1 =
        json['item1'] != null ? new CommonModel.fromJson(json['item1']) : null;
    endColor = json['endColor'];
    mainItem = json['mainItem'] != null
        ? new CommonModel.fromJson(json['mainItem'])
        : null;
    item4 =
        json['item4'] != null ? new CommonModel.fromJson(json['item4']) : null;
    item3 =
        json['item3'] != null ? new CommonModel.fromJson(json['item3']) : null;
    startColor = json['startColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }
    if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }
    data['endColor'] = this.endColor;
    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }
    if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
    if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }
    data['startColor'] = this.startColor;
    return data;
  }
}
