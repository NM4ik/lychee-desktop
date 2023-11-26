import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lychee_desktop/core/os_info/os_info.dart';
import 'package:lychee_desktop/native/macOsPlugin/macos_window_manager.dart';
import 'package:lychee_desktop/widgets/os_version.dart';

class LycheeApp extends StatefulWidget {
  const LycheeApp({super.key});

  @override
  State<LycheeApp> createState() => _LycheeAppState();
}

class _LycheeAppState extends State<LycheeApp> {
  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  String? data;

  void _getInfo() async {
    data = await MacOSPlugin.getOSInfo();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                MacOSPlugin.setWindowMinSize(Size(600, 600));
              },
              child: Text('setMin'),
            ),

             ElevatedButton(
              onPressed: () {
                MacOSPlugin.setWindowSize(Size(1200, 1200), animate: true);
              },
              child: Text('setSize'),
            ),
            OSInfoWidget(
              osInfo: OSInfo.osInfoName,
            ),
          ],
        ),
      ),
    );
  }
}
