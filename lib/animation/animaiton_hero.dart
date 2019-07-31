import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_trip/animation/photo_widget.dart';
import 'package:flutter_trip/animation/radial_expansion.dart';


///
/// Created by Maker on 2019/7/18
/// Description:
///

class AnimationHero extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2,
                height: kMaxRadius * 2,
                child: Hero(
                    createRectTween: _createRectTween,
                    tag: imageName,
                    child: RadialExpansion(
                      maxFadius: kMaxRadius,
                      child: Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(
                height: 16.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
          createRectTween: _createRectTween,
          tag: imageName,
          child: RadialExpansion(
            maxFadius: kMaxRadius,
            child: Photo(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:
                    (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                  return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: opacityCurve.transform(animation.value),
                          child: _buildPage(context, imageName, description),
                        );
                      });
                }));
              },
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Radial Extansion Hero"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(
                context,
                "https://t1.27270.com/uploads/tu/201712/266/eb3d6d0b81.jpg",
                "Beauty"),
            _buildHero(
                context,
                "http://img2.selfimg.com.cn/GQgalleryNoWatermark/2016/12/26/1482735317_hl9F3i.jpg",
                "Girl"),
            _buildHero(
                context,
                "https://cn.bing.com/th?id=OIP.Lg1il58GIuir16xob0YK8gHaNK&pid=Api&rs=1",
                "Girl"),
          ],
        ),
      ),
    );
  }
}
