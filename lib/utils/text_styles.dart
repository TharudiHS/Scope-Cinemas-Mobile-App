import 'package:flutter/material.dart';
import 'app_colours.dart';

class TextStyles {
  static const TextStyle size24SofiaPro = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 24,
    fontWeight: FontWeight.w500, //medium
    color: AppColours.white,
    letterSpacing: 0,
    height: 1.5,
  );
  static const TextStyle size16SofiaPro = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColours.darkBlue,
    letterSpacing: 0,
    height: 1.25,
  );
  static const TextStyle size17SofiaPro = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 17,
    fontWeight: FontWeight.w400, //regular
    color: AppColours.white,
    letterSpacing: 0,
    height: 1.235,
  );
  static const TextStyle size14SofiaPro = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColours.crimsonRed,
    decoration: TextDecoration.underline,
    letterSpacing: 0,
  );
  static const TextStyle size14SofiaProlightGrey = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColours.lightGrey,
    letterSpacing: 0,
  );
  static const TextStyle size14SofiaProwhite = TextStyle(
    fontFamily: 'SofiaPro',
    fontSize: 14,
    fontWeight: FontWeight.w300, //light
    color: AppColours.white,
    letterSpacing: 0,
  );
}
