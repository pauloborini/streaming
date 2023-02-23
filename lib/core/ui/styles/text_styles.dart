import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'Login';

  TextStyle get light => TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get regular => TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get medium => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get semiBold => TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get bold => TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get xBold => TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: font,
      color: ColorsApp.instance.fontColor,
      fontSize: 22);

  TextStyle get buttonLabel => bold.copyWith(fontSize: 22, color: ColorsApp.instance.fontColor);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
