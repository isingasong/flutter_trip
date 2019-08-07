import 'package:flutter/material.dart';
import 'package:flutter_trip/common/constant.dart';
import 'package:flutter_trip/page/search.dart';
import 'package:flutter_trip/plugin/asr_manage.dart';
import 'package:flutter_trip/widget/speak_animation.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
///
class Speak extends StatefulWidget {
  @override
  _SpeakState createState() => _SpeakState();
}

class _SpeakState extends State<Speak> with SingleTickerProviderStateMixin {
  String _speakTips = " — 长按说话 —";
  String _speakResult = "";
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _topItem(),
            _bottomItem(),
          ],
        ),
      ),
    );
  }

  _topItem() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            "您可以这样说",
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ),
        Text(
          "故宫门票\n欧洲14国2日游\n迪士尼火锅",
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            _speakResult,
            style: TextStyle(color: Colors.blue, fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  _bottomItem() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTapDown: (t) {
              _speakStart();
            },
            onTapUp: (t) {
              _speakStop();
            },
            onTapCancel: _speakStop,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    _speakTips,
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: Constant.SPEAK_ANIMATION_SIZE,
                      width: Constant.SPEAK_ANIMATION_SIZE,
                    ),
                    Center(
                      child: SpeakAnimation(
                        animation: _animation,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: 0.0,
              bottom: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 32.0,
                ),
              ))
        ],
      ),
    );
  }

  _speakStart() {
    _controller.forward();
    _speakTips = " — 识别中 — ";
    setState(() {});
    AsrManager.start().then((result){
      if(result != null && result.length > 0){
        setState(() {
          _speakResult = result;
        });
        Navigator.pop(context);
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return Search(keyword: result);
        }));
        print("AIResult::$result");

      }

    }).catchError((e){
      print("AIError::${e.toString()}");
    });
  }

  _speakStop() {
    _controller.reset();
    _controller.stop();
    _speakTips = " — 按住说话 — ";
    setState(() {});
    AsrManager.stop().then((result){
    });
  }
}
