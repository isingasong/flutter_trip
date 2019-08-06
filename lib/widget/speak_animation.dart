import 'package:flutter/material.dart';
import 'package:flutter_trip/common/constant.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
///
class SpeakAnimation extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1.0, end: 0.5);
  static final _sizeTween = Tween<double>(
      begin: Constant.SPEAK_ANIMATION_SIZE,
      end: Constant.SPEAK_ANIMATION_SIZE - 20);

  SpeakAnimation({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(Constant.SPEAK_ANIMATION_SIZE / 2),
        ),
        child: Icon(Icons.mic,color: Colors.white,size: 32.0,),
      ),
    );
  }
}
