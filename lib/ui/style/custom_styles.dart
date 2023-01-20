import 'package:flutter/material.dart';

class EstiloApp {
  static MaterialColor primarypurple =
      MaterialColor(_primarypurpleValue, <int, Color>{
    900: const Color.fromARGB(90, 0, 23, 92),
    1000: Color(_primarypurpleValue),
  });
  static int _primarypurpleValue = 0xFF9870ae;

  static MaterialColor primaryblue =
      MaterialColor(_primaryblueValue, <int, Color>{
    100: Color.fromARGB(0, 227, 53, 91),
    200: Color.fromARGB(0, 227, 53, 91),
    300: Color.fromARGB(0, 227, 53, 91),
    400: Color.fromARGB(0, 227, 53, 91),
    500: Color.fromARGB(255, 40, 29, 97),
    600: Color.fromARGB(255, 40, 29, 97),
    700: Color.fromARGB(255, 40, 29, 97),
    800: Color.fromARGB(10, 227, 53, 91),
    900: Color.fromARGB(255, 40, 29, 97),
    1000: Color(_primaryblueValue),
  });
  static int _primaryblueValue = 0xFF27273d;

  static MaterialColor colorwhite =
      MaterialColor(_colorwhiteValue, <int, Color>{
    1000: Color(_colorwhiteValue),
  });
  static int _colorwhiteValue = 0xFFFFFFFF;

  static MaterialColor colorblack =
      MaterialColor(_colorblackValue, <int, Color>{
    1000: Color(_colorblackValue),
  });
  static int _colorblackValue = 0xFF000000;

  static LinearGradient horizontalgradientpurpleblue = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      EstiloApp.primarypurple,
      EstiloApp.primaryblue,
    ],
  );

  static LinearGradient horizontalgradientblue = LinearGradient(
    begin: Alignment.centerLeft,
    end: const Alignment(0.0, 1.0),
    colors: <Color>[
      EstiloApp.primaryblue,
      EstiloApp.primaryblue,
    ],
  );

  static BoxDecoration decorationBoxwhite = BoxDecoration(
      color: EstiloApp.colorwhite,
      boxShadow: kElevationToShadow[9],
      borderRadius: BorderRadius.circular(20));
}
