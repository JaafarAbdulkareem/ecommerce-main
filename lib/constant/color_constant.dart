import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class AppColor {
  static const Color mainColor1 = Colors.orange;
  static const Color mainColor2 = Colors.pink;
  static const Gradient gradient = LinearGradient(
    colors: [
      mainColor1,
      mainColor2,
    ],
  );
}

class AppSnackBar {
  static const Duration duration = Duration(seconds: 2);
  static const LinearGradient backgroundColor = LinearGradient(
    colors: [
      Colors.orange,
      Colors.orange,
      Colors.pink,
    ],
  );
  static const Color messageColor = Colors.black;
  static const double messageSize = 16;
  static const FlushbarPosition direction = FlushbarPosition.TOP;
}
