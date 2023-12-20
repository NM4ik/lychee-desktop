import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lychee_desktop/core/os_info/os_info.dart';
import 'package:lychee_desktop/native/macOsPlugin/macos_window_manager.dart';
import 'package:lychee_desktop/utils/theme/theme.dart';
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

  bool _isDark = false;

  final AppTheme _appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: _appTheme.themeLight,
      darkTheme: _appTheme.themeDark,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
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
                setState(() {
                  _isDark = true;
                });

                MacOSPlugin.setWindowMinSize(Size(500, 500));
              },
              child: Text('toDark'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isDark = false;
                });
                MacOSPlugin.setWindowSize(Size(1200, 1200));

              },
              child: Text('toLight'),
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
