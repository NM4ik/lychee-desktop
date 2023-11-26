import 'package:flutter/material.dart';
import 'package:lychee_desktop/utils/theme/theme.dart';

class ThemeNotifier extends ChangeNotifier {
  final ThemeData _theme;

  ThemeNotifier() : _theme = AppTheme().themeLight;

  ThemeData get theme => _theme;
}
