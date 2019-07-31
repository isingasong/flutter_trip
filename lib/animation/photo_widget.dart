import 'package:flutter/material.dart';
///
/// Created by Maker on 2019/7/31
/// Description: 
///
class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final Color color;

  const Photo({Key key, this.photo, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme
          .of(context)
          .primaryColor
          .withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child:
        LayoutBuilder(builder: (BuildContext context, BoxConstraints size) {
          return Image.network(
            photo,
            fit: BoxFit.contain,
          );
        }),
      ),
    );
  }
}