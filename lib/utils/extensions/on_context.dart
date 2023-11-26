import 'package:flutter/material.dart';
import 'package:lychee_desktop/utils/theme/extension.dart';

extension ExpandedContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  ThemeTextExtension? get tStyle => theme.extension<ThemeTextExtension>();

  bool get isDarkTheme => theme.brightness == Brightness.dark;
}
