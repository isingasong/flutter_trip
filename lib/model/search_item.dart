///
/// Created by Maker on 2019/8/1.
/// Description:
///

class SearchItem {
  String word;
  String type;
  String price;
  String star;
  String zonename;
  String districtname;
  String url;

  SearchItem(
      {this.word,
      this.type,
      this.price,
      this.star,
      this.zonename,
      this.districtname,
      this.url});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["word"] = this.word;
    data["type"] = this.type;
    data["price"] = this.price;
    data["star"] = this.star;
    data["zonename"] = this.zonename;
    data["districtname"] = this.districtname;
    data["url"] = this.url;
    return data;
  }

  SearchItem.fromJson(Map<String, dynamic> json) {
    word = json["word"];
    type = json["type"];
    price = json["price"];
    star = json["star"];
    zonename = json["zonename"];
    districtname = json["districtname"];
    url = json["url"];
  }
}
