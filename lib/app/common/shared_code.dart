import 'package:flutter/material.dart';

class SharedCode {
  static double defaultPadding = 30;
  static EdgeInsets defaultPagePadding = EdgeInsets.symmetric(vertical: defaultPadding, horizontal: 25.0);

  static void showSnackBar(BuildContext context, bool isError, String content,
      {Duration? duration}) {
    Color color = isError ? Colors.red : Colors.green;
    SnackBar snackBar = SnackBar(
      content: Text(content, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      duration: duration ?? const Duration(milliseconds: 4000),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}