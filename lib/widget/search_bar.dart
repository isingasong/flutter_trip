import 'package:flutter/material.dart';
import 'package:flutter_trip/common/search_bar_type.dart';

///
/// Created by Maker on 2019/8/1.
/// Description:
///

class SearchBar extends StatefulWidget {
  final bool enabled;
  final bool hideLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakButtonClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakButtonClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _goNormalSearch()
        : _goHomeSearch();
  }

  _goHomeSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapGesture(
              Container(
                padding: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
                child: Row(
                  children: <Widget>[
                    Text("杭州",style: TextStyle(color: _homeFontColor(),fontSize: 14.0),),
                    Icon(Icons.expand_more,color: _homeFontColor(),size: 22.0,),
                  ],
                ),
              ),
              widget.leftButtonClick),
          Expanded(flex: 1, child: _inputBox()),
          _wrapGesture(
              Container(
                padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                child: Icon(Icons.mail,color: _homeFontColor(),size: 22.0,),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _goNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _wrapGesture(
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                child: widget?.hideLeft ?? false
                    ? null
                    : Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 24.0,
                      ),
              ),
              widget.leftButtonClick),
          Expanded(flex: 1, child: _inputBox()),
          _wrapGesture(
              Container(
                padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                child: Text(
                  "搜索",
                  style: TextStyle(color: Colors.blue, fontSize: 18.0),
                ),
              ),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  _wrapGesture(Widget widget, void Function() callback) {
    return GestureDetector(
      onTap: callback,
      child: widget,
    );
  }

  _inputBox() {
    Color inputBoxBackgroundColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxBackgroundColor = Colors.white;
    } else {
      inputBoxBackgroundColor = Color(0xFFEDEDED);
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
      decoration: BoxDecoration(
        color: inputBoxBackgroundColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 4.0 : 16.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xFFA9A9A9)
                : Colors.blue,
            size: 20.0,
          ),
          Expanded(
              flex: 1,
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: controller,
                      onChanged: (text) => _onChange(text),
                      autofocus: true,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                        border: InputBorder.none,
                        hintText: widget.hint ?? "",
                        hintStyle: TextStyle(fontSize: 16.0),
                      ),
                    )
                  : _wrapGesture(
                      Container(
                        child: Text(
                          widget.defaultText,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
          showClear
              ? _wrapGesture(
                  Icon(
                    Icons.clear,
                    size: 22.0,
                    color: Colors.grey,
                  ), () {
                  controller.clear();
                  _onChange("");
                  setState(() {});
                })
              : _wrapGesture(
                  Icon(
                    Icons.mic,
                    size: 22.0,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakButtonClick)
        ],
      ),
    );
  }

  _onChange(String text) {
    if (text.length > 0) {
      showClear = true;
    } else {
      showClear = false;
    }
    setState(() {});

    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor(){
    return widget.searchBarType == SearchBarType.homeLight ? Colors.black54 : Colors.white;
  }
}
