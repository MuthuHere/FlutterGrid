import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppMessage {
  /// toast message
  static Color _backgroundColor = Colors.black87;
  static Color _textColor = Colors.white;

  static void toast(String message) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: _backgroundColor,
        textColor: _textColor,
        fontSize: 16.0);
  }
}
