// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThemeTextExtension extends ThemeExtension<ThemeTextExtension> {
  final TextStyle? light;
  final TextStyle? regular;
  final TextStyle? medium;
  final TextStyle? semiBold;
  final TextStyle? bold;

  ThemeTextExtension({
    required this.light,
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });

  @override
  ThemeExtension<ThemeTextExtension> lerp(
      covariant ThemeExtension<ThemeTextExtension>? other, double t) {
    return this;
  }

  @override
  ThemeExtension<ThemeTextExtension> copyWith({
    TextStyle? light,
    TextStyle? regular,
    TextStyle? medium,
    TextStyle? semiBold,
    TextStyle? bold,
  }) {
    return ThemeTextExtension(
      light: light ?? this.light,
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      semiBold: semiBold ?? this.semiBold,
      bold: bold ?? this.bold,
    );
  }
}
