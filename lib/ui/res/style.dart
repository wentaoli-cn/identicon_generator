import 'package:flutter/material.dart';
import 'color.dart';
import 'font/font.dart';

class TextStylez {
  static const regular12 = TextStyle(
    color: Colorz.white,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  static const regular14 = TextStyle(
    color: Colorz.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const regular16 = TextStyle(
    color: Colorz.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const bold18 = TextStyle(
    color: Colorz.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );

  static const bold20 = TextStyle(
    color: Colorz.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
}

final appTheme = ThemeData(
  scaffoldBackgroundColor: Colorz.black,
  fontFamily: Fontz.ubuntuMono.name,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colorz.white,
    selectionColor: Colorz.khaki,
    selectionHandleColor: Colorz.lightYellow,
  ),
);
