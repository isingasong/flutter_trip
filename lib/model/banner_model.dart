///
/// Created by Maker on 2019/7/31.
/// Description:
/// 
class BannerModel{
  String icon;
  String url;

  BannerModel({this.icon, this.url});

  BannerModel.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

