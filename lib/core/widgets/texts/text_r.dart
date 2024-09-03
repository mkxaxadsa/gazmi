import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class TextR extends StatelessWidget {
  const TextR(
    this.title, {
    super.key,
    required this.fontSize,
    this.font = Fonts.sfR,
    this.color = AppColors.white,
    this.center = false,
  });

  final String title;
  final double fontSize;
  final String font;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: center ? TextAlign.center : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: font,
      ),
    );
  }
}

class TextM extends StatelessWidget {
  const TextM(
    this.title, {
    super.key,
    required this.fontSize,
    this.font = Fonts.sfM,
    this.color = AppColors.white,
    this.center = false,
  });

  final String title;
  final double fontSize;
  final String font;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: center ? TextAlign.center : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: font,
      ),
    );
  }
}

class TextB extends StatelessWidget {
  const TextB(
    this.title, {
    super.key,
    required this.fontSize,
    this.font = Fonts.sfB,
    this.color = AppColors.white,
    this.center = false,
  });

  final String title;
  final double fontSize;
  final String font;
  final Color color;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: center ? TextAlign.center : null,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: font,
      ),
    );
  }
}
