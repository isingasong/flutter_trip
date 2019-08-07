import 'package:flutter/material.dart';
import 'package:flutter_trip/model/travel_item.dart';
import 'package:flutter_trip/widget/webview.dart';

///
/// Created by Maker on 2019/8/7.
/// Description:
///
class TravelItems extends StatelessWidget {
  final TravelItem item;
  final int index;

  const TravelItems({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.article != null && item.article.urls.length > 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: item.article.urls[0].h5Url,
                        title: "详情",
                      )));
        }
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _image(),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 16.0, 8.0, 16.0),
                child: Text(
                  item.article?.articleTitle ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black87, fontSize: 14.0),
                ),
              ),
              _infoText(),
              SizedBox(
                height: 16.0,
              ),

            ],
          ),
        ),
      ),
    );
  }

  _image() {
    return Stack(
      children: <Widget>[
        Image.network(item.article.images[0]?.dynamicUrl),
        Positioned(
          child: Container(
            padding: EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black54),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 12.0,
                  ),
                ),
                LimitedBox(
                  maxWidth: 130.0,
                  child: Text(
                    _poiItmes(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                )
              ],
            ),
          ),
          bottom: 8.0,
          left: 8.0,
        )
      ],
    );
  }

  String _poiItmes() {
    if (item.article.pois == null || item.article.pois.length == 0) {
      return "未知";
    } else {
      return item.article.pois[0]?.poiName ?? "未知";
    }
  }

  _infoText() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                child: Image.network(
                  item.article?.author?.coverImage?.dynamicUrl,
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              Container(
                width: 90.0,
                padding: EdgeInsets.all(4.0),
                child: Text(
                  item.article.author?.nickName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: Colors.orange,
                size: 14.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: Text(
                  item.article.likeCount.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
