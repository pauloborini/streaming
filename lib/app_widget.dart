import 'package:flutter/material.dart';

import 'core/ui/theme/custom_scroll_behavior.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_route.dart';
import 'pages/initial_page/initial_route.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Streaming',
      theme: ThemeConfig.theme,
      initialRoute: "/initial_page",
      routes: {
        "/initial_page": (context) => InitialRoute.page,
        "/login_page": (context) => LoginRoute.page,
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
