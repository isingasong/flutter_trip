import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/model/banner_model.dart';
import 'package:flutter_trip/widget/webview.dart';

///
/// Created by Maker on 2019/7/31.
/// Description:
///

class BannerWidget extends StatefulWidget {
  final List<BannerModel> bannerList;

  BannerWidget({this.bannerList});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.bannerList == null
        ? null
        : Container(
            height: 200.0,
            child: Swiper(
              itemCount: widget.bannerList.length,
              autoplay: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WebView(url: widget.bannerList[index].url);
                    }));
                  },
                  child: Image.network(
                    widget.bannerList[index].icon,
                    fit: BoxFit.fill,
                  ),
                );
              },
              pagination: SwiperPagination(),
            ),
          );
  }
}
