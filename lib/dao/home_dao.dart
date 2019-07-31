import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:http/http.dart' as http;

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class HomeDao {
  static Future<HomeModel> getHomeData() async {
    final response = await http.get(Api.HOME_URL);
    if (response.statusCode == 200) {
      // 防止乱码
      Utf8Decoder utf8coder = Utf8Decoder();
      var result = json.decode(utf8coder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception("Failed to load data...");
    }
  }
}
