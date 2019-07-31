///
/// Created by Maker on 2019/7/31.
/// Description:
///
class CommonModel {
  String statusBarColor;
  String icon;
  String title;
  String url;
  bool hideAppBar;

  CommonModel(
      {this.statusBarColor, this.icon, this.title, this.url, this.hideAppBar});

  CommonModel.fromJson(Map<String, dynamic> json) {
    statusBarColor = json['statusBarColor'];
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusBarColor'] = this.statusBarColor;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}
