import 'package:flutter/services.dart';

///
/// Created by Maker on 2019/8/6.
/// Description:
///
class AsrManager {
  static const METHOD_NAME = "flutter_max_asr_plugin";
  static const MethodChannel _methodChannel = MethodChannel(METHOD_NAME);

  /// 开始录音
  static Future<String> start({Map params}) async {
    return await _methodChannel.invokeMethod("start", params ?? "");
  }

  /// 停止录音
  static Future<String> stop() async {
    return await _methodChannel.invokeMethod("stop");
  }

  /// 取消录音
  static Future<String> cancel() async {
    return await _methodChannel.invokeMethod("cancel");
  }

}
