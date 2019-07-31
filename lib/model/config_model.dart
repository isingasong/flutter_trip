///
/// Created by Maker on 2019/7/31.
/// Description:
/// 


class ConfigModel{
  String searchUrl;

  ConfigModel({this.searchUrl});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}