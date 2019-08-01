import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/widget/webview.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;

  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    List<Widget> items = [];
    if (salesBox == null) return null;
    items.add(_doubleItem(
        context, salesBox.bigCard1, salesBox.bigCard2, true, false));
    items.add(_doubleItem(
        context, salesBox.smallCard1, salesBox.smallCard2, false, false));
    items.add(_doubleItem(
        context, salesBox.smallCard3, salesBox.smallCard4, false, true));
    return Column(
      children: <Widget>[
        Container(
          height: 44.0,
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xfff7f7f7)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                salesBox.icon,
                height: 16.0,
                fit: BoxFit.fill,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WebView(
                      url: salesBox.moreUrl,
                      title: "更多活动",
                    );
                  }));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    "获取更多福利 >",
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(1, 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(2, 3),
        ),
      ],
    );
  }

  Widget _doubleItem(BuildContext context, CommonModel leftModel,
      CommonModel rightModel, bool big, bool last) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _item(context, leftModel, big, true, last),
        _item(context, rightModel, big, false, last),
      ],
    );
  }

  Widget _item(
      BuildContext context, CommonModel model, bool big, bool left, bool last) {
    BorderSide borderSide = BorderSide(color: Colors.white, width: 0.8);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
            url: model.url,
            title: model.title,
            statusBarColor: model.statusBarColor,
            hideAppBar: model.hideAppBar,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          right: left ? borderSide : BorderSide.none,
          bottom: last ? BorderSide.none : borderSide,
        )),
        child: Image.network(
          model.icon,
          width: MediaQuery.of(context).size.width / 2 - 14.0,
          height: big ? 130.0 : 80.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
