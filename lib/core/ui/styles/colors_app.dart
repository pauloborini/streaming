import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFF1D79C4);

  Color get background => const Color(0xFF222223);

  Color get secondary => const Color(0xFF107D98);

  Color get fontColor => const Color.fromARGB(255, 245, 245, 245);

  Color get iconColor => const Color.fromARGB(255, 245, 245, 245);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
