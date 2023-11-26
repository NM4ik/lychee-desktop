import 'package:flutter/material.dart';

class AppTextTheme {
  final double _defaultSize = 16;
  final String _fontFam = 'Montserrat';

  TextStyle? get light => TextStyle(fontFamily: _fontFam, fontWeight: FontWeight.w300, fontSize: _defaultSize);
  TextStyle? get regular => TextStyle(fontFamily: _fontFam, fontWeight: FontWeight.w400, fontSize: _defaultSize);
  TextStyle? get medium => TextStyle(fontFamily: _fontFam, fontWeight: FontWeight.w500, fontSize: _defaultSize);
  TextStyle? get semiBold => TextStyle(fontFamily: _fontFam, fontWeight: FontWeight.w600, fontSize: _defaultSize);
  TextStyle? get bold => TextStyle(fontFamily: _fontFam, fontWeight: FontWeight.w700, fontSize: _defaultSize);
}