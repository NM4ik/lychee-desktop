import 'dart:io';

import 'package:lychee_desktop/native/macOsPlugin/macos_window_manager.dart';

class OSInfo {
  static String? osInfoName;

  static Future<void> setOSInfo() async {
    osInfoName = await MacOSPlugin.getOSInfo();

    if(Platform.isMacOS) {
      osInfoName = 'MacOS $osInfoName';
    }
  }
}
