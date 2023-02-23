import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    focusColor: Colors.white24,
    fontFamily: 'Login',
    useMaterial3: false,
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    backgroundColor: ColorsApp.instance.background,
    scaffoldBackgroundColor: ColorsApp.instance.background,
    iconTheme: IconThemeData(color: ColorsApp.instance.iconColor),
    appBarTheme: AppBarTheme(
        toolbarHeight: 45,
        backgroundColor: Colors.white12,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ColorsApp.instance.iconColor),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )),
  );
}
