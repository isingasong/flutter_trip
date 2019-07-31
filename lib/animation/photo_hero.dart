import 'package:flutter/material.dart';


///
/// Created by Maker on 2019/7/18
/// Description: 
///
class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(tag: photo, child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Image.network(photo,fit: BoxFit.contain,),
        ),
      )),
    );
  }
}


