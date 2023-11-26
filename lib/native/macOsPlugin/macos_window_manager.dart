import 'package:flutter/services.dart';

class MacOSPlugin {
  static const _methodChannel = MethodChannel('com.mikhailov.MacOSPlatformPlugin');

  static Future<String?> getOSInfo() async {
    final osInfo = await _methodChannel.invokeMethod('getOSInfo');

    if (osInfo is String) {
      return osInfo;
    }

    return null;
  }

  static Future<bool> setWindowSize(Size size, {bool animate = false}) async {
    final data = await _methodChannel.invokeMethod('setWindowSize',
        {'width': size.width, 'height': size.height, 'animate': animate});

    if (data is bool) {
      return data;
    }

    return false;
  }

  static Future<bool> setWindowMinSize(Size size) async {
    final data = await _methodChannel.invokeMethod(
        'setWindowMinSize', {'width': size.width, 'height': size.height});

    if (data is bool) {
      return data;
    }

    return false;
  }
}
