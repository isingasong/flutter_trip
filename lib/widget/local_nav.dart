import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widget/webview.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        height: 66.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Padding(padding: EdgeInsets.all(8),
        child: _items(context),),
      ),
    );
  }

  _items(BuildContext context) {
    if(localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );


  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  WebView(url: model.url,statusBarColor: model.statusBarColor,);
        }));
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon,height: 32.0,width: 32.0,fit: BoxFit.fill,),
          Text(model.title,style: TextStyle(fontSize: 12.0),)
        ],
      ),
    );

  }
}
