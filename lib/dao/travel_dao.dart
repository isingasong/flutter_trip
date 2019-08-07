import 'dart:convert';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:flutter_trip/model/travel_tab_model.dart';
import 'package:http/http.dart' as http;

///
/// Created by Maker on 2019/8/6.
/// Description:
///
///

var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};
class TravelDao{
  static Future<TravelTabModel> getTravelData() async {
    final response = await http.get(Api.TRAVEL_URL);
    if (response.statusCode == 200) {
      // 防止乱码
      Utf8Decoder utf8coder = Utf8Decoder();
      var result = json.decode(utf8coder.convert(response.bodyBytes));
      TravelTabModel model = TravelTabModel.fromJson(result);
      print("TravelDao:${model.toString()}");
      return model;
    } else {
      throw Exception("Failed to load data...");
    }
  }

  static Future<TravelModel> getTravelTabData({String url,Map params,String groupChannelCode,int pageIndex,int pageSize}) async {
    Map paramsMap = params["pagePara"];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    paramsMap['groupChannelCode'] = groupChannelCode;
    
    final response = await http.post(url,body: jsonEncode(params));
    if (response.statusCode == 200) {
      // 防止乱码
      Utf8Decoder utf8coder = Utf8Decoder();
      var result = json.decode(utf8coder.convert(response.bodyBytes));
      TravelModel model = TravelModel.fromJson(result);
      print("TabData::;${model.toString()}");
      return model;
    } else {
      throw Exception("Failed to load data...");
    }
  }

}


