
import 'package:flutter/material.dart';

TextStyle customTextStyle({double size = 18.0, Color color = Colors.black87}) =>
    TextStyle(
        fontFamily: 'Monserrat',
        fontSize: size,
        decoration: TextDecoration.none,
        color: color);

TextStyle customBoldText(
    {double size = 18.0,
      Color color = Colors.black87,
      FontWeight fontWeight = FontWeight.bold}) =>
    TextStyle(
        fontFamily: 'Montserrat',
        fontSize: size,
        color: color,
        decoration: TextDecoration.none,
        fontWeight: fontWeight);
