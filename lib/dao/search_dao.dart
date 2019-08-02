import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:http/http.dart' as http;

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class SearchDao {
  static Future<SearchModel> getSearchData(String url,String keyWord) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // 防止乱码
      Utf8Decoder utf8coder = Utf8Decoder();
      var result = json.decode(utf8coder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      model.keyWord = keyWord;
      return model;
    } else {
      throw Exception("Failed to load data...");
    }
  }
}
