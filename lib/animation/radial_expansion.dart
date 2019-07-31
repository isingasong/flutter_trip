import 'package:flutter/material.dart';
import 'dart:math' as math;
///
/// Created by Maker on 2019/7/31
/// Description: 
///
class RadialExpansion extends StatelessWidget {
  final double maxFadius;
  final clipRectSize;
  final Widget child;

  const RadialExpansion({Key key, this.maxFadius, this.child})
      : clipRectSize = 2.0 * (maxFadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}