import 'package:flutter/material.dart';
import 'package:lychee_desktop/utils/theme/extension.dart';
import 'package:lychee_desktop/utils/theme/text_theme.dart';

class AppTheme {
  final _textStyles = AppTextTheme();

  ThemeData get themeLight => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        extensions: [
          ThemeTextExtension(
            light: _textStyles.light,
            regular: _textStyles.regular,
            medium: _textStyles.medium,
            semiBold: _textStyles.semiBold,
            bold: _textStyles.bold,
          ),
        ],
      );

  ThemeData get themeDark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        extensions: [
          ThemeTextExtension(
            light: _textStyles.light,
            regular: _textStyles.regular,
            medium: _textStyles.medium,
            semiBold: _textStyles.semiBold,
            bold: _textStyles.bold,
          ),
        ],
      );
}
