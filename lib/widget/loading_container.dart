import 'package:flutter/material.dart';
///
/// Created by Maker on 2019/8/7
/// Description: 
///
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer(
      {Key key,
        @required this.isLoading,
        this.cover = false,
        @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading ? child : _loadingView
        : Stack(
      children: <Widget>[child, isLoading ? _loadingView : Container()],
    );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}