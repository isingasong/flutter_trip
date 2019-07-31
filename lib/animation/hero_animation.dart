import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_trip/animation/photo_hero.dart';
///
/// Created by Maker on 2019/7/31
/// Description: 
///

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Aniamtion"),
      ),
      body: Center(
        child: PhotoHero(
          photo: "https://cn.bing.com/th?id=OIP.xf1m_1kKMOcFipWFCXXLMQHaEo&pid=Api&rs=1",
          width: 300.0,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Scaffold(
                appBar: AppBar(
                  title: Text("Filter page"),
                ),
                body: Container(
                  color: Colors.blue,
                  child: PhotoHero(
                    photo: "https://cn.bing.com/th?id=OIP.xf1m_1kKMOcFipWFCXXLMQHaEo&pid=Api&rs=1",
                    width: 100.0,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}