import 'package:flutter/material.dart';
import 'package:lychee_desktop/core/os_info/os_info.dart';
import 'package:lychee_desktop/feature/app/lychee_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OSInfo.setOSInfo();

  runApp(const LycheeApp());
}
