import 'article.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
/// 

class TravelItem {
  int type;
  Article article;

  TravelItem({this.type, this.article});

  TravelItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.article != null) {
      data['article'] = this.article.toJson();
    }
    return data;
  }
}

