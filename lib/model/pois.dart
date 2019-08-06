import 'package:flutter_trip/model/poi_ext.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
/// 
class Pois {
  int poiType;
  int poiId;
  String poiName;
  int districtId;
  String districtName;
  String districtENName;
  PoiExt poiExt;
  int source;
  int isMain;

  Pois(
      {this.poiType,
        this.poiId,
        this.poiName,
        this.districtId,
        this.districtName,
        this.districtENName,
        this.poiExt,
        this.source,
        this.isMain});

  Pois.fromJson(Map<String, dynamic> json) {
    poiType = json['poiType'];
    poiId = json['poiId'];
    poiName = json['poiName'];
    districtId = json['districtId'];
    districtName = json['districtName'];
    districtENName = json['districtENName'];
    poiExt =
    json['poiExt'] != null ? new PoiExt.fromJson(json['poiExt']) : null;
    source = json['source'];
    isMain = json['isMain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poiType'] = this.poiType;
    data['poiId'] = this.poiId;
    data['poiName'] = this.poiName;
    data['districtId'] = this.districtId;
    data['districtName'] = this.districtName;
    data['districtENName'] = this.districtENName;
    if (this.poiExt != null) {
      data['poiExt'] = this.poiExt.toJson();
    }
    data['source'] = this.source;
    data['isMain'] = this.isMain;
    return data;
  }
}

