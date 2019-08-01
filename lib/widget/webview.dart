import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
const CATCH_URL = ["m.ctrip.com/","m.ctrip.com/html5/","m.ctrip.com/html5"];

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  const WebView(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webview = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChange;
  StreamSubscription<WebViewStateChanged> _onStateChange;
  StreamSubscription<WebViewHttpError> _onHttpError;
  bool exiting;

  @override
  void initState() {
    super.initState();
    webview.close();
    _onUrlChange = webview.onUrlChanged.listen((url) {});

    _onStateChange = webview.onStateChanged.listen((state) {
      switch (state.type) {
        case WebViewState.startLoad:
          if(_isToMain(state.url) && !exiting){
            if(widget.backForbid){
              webview.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }

          }
          break;
        default:
          break;
      }
    });

    _onHttpError = webview.onHttpError.listen((error) {
      print("WebViewHttpError: $error");
    });
  }
  _isToMain(String url){
    bool contain = false;
    for(final value in CATCH_URL){
      if(url?.endsWith(value) ?? false){
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? "ffffff";
    Color backButtonColor;
    if (statusBarColorStr == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse("0xff$statusBarColorStr")), backButtonColor),
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    value: 4.0,

                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    "Loading......",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  )
                ],
              )),
            ),
          ))
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 23.0,
      );
    }
    return Container(
    color: backgroundColor,
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10.0,top: 26.0),
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: backButtonColor,
                  size: 26.0,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                top: 26.0,
                child: Center(
                  child: Text(
                    widget.title ?? "",
                    style: TextStyle(color: backButtonColor, fontSize: 20.0),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _onUrlChange.cancel();
    _onStateChange.cancel();
    _onHttpError.cancel();
    webview.dispose();
    super.dispose();
  }
}
