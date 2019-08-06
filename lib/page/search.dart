import 'package:flutter/material.dart';
import 'package:flutter_trip/common/colours.dart';
import 'package:flutter_trip/common/strings.dart';
import 'package:flutter_trip/dao/api.dart';
import 'package:flutter_trip/dao/search_dao.dart';
import 'package:flutter_trip/model/search_item.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:flutter_trip/page/speak.dart';
import 'package:flutter_trip/widget/search_bar.dart';
import 'package:flutter_trip/widget/webview.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class Search extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  const Search(
      {Key key,
      this.hideLeft,
      this.searchUrl = Api.SEARCH_URL,
      this.keyword,
      this.hint})
      : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String keyword = "";
  SearchModel model;
  
  @override
  void initState() {
    if(widget.keyword != null){
      _onTextChanged(widget.keyword);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: Column(children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: model?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return _item(index);
                  }),
            ),
          )
        ]));
  }

  void _onTextChanged(String value) {
    keyword = value;
    if (value.length == 0) {
      setState(() {
        model = null;
      });
      return;
    }
    _search(keyword);
  }

  _search(String keyWord) async {
    model = await SearchDao.getSearchData(widget.searchUrl + keyWord, keyWord);
    if (model.keyWord == keyWord) {
      setState(() {});
    }
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colours.color_66,
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Container(
            height: 80.0,
            color: Colors.white,
            padding: EdgeInsets.only(top: 24.0),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              speakButtonClick: _gotoSpeak,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChanged,
            ),
          ),
        )
      ],
    );
  }

  void _gotoSpeak() {
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return Speak();
    }));
  }

  Widget _item(int index) {
    if (model == null || model.data == null) return null;
    SearchItem item = model.data[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
            url: item.url,
            title: "详情",
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 0.5,
          color: Colors.grey[300],
        ))),
        child: Row(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage(_getAssetsImage(item.type)),
                height: 30.0,
                width: 30.0,
              ),
              margin: EdgeInsets.only(right: 16.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 290.0,
                  child: _setTitle(item),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0),
                  child: RichText(
                      text: TextSpan(
                          text: item.price ?? "",
                          style: TextStyle(color: Colors.orange),
                          children: [
                        TextSpan(
                          text: "   ${item.star ?? ""}",
                          style: TextStyle(
                            color: Colours.color_33,
                          ),
                        ),
                      ])),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getAssetsImage(String type) {
    String path = "travelgroup";
    if (type == null) {
      return "assets/type_travelgroup.png";
    }

    for (final val in Strings.TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return "assets/type_$path.png";
  }

  _setTitle(SearchItem item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keyWordSpan(item.word, model.keyWord));
    spans.add(TextSpan(
        text: " ${item.districtname ?? ""} ${item.zonename ?? ""}",
        style: TextStyle(
          color: Colours.color_33,
        )));
    return RichText(text: TextSpan(children: spans));
  }

  _keyWordSpan(String word, String keyWord) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;
    List<String> strings = word.split(keyWord);
    for (int i = 0; i < strings.length; i++) {
      if ((i + 1) % 2 == 0) {
        spans.add(
            TextSpan(text: keyWord, style: TextStyle(color: Colors.orange)));
      }
      String value = strings[i];
      if (value != null && value.length > 0) {
        spans.add(
            TextSpan(text: value, style: TextStyle(color: Colours.color_99)));
      }
    }
    return spans;
  }
}
