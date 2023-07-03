import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color black9004c = fromHex('#4c000000');

  static Color blueA100Cc = fromHex('#cc7eb3f2');

  static Color gray700 = fromHex('#696969');

  static Color blueGray400 = fromHex('#888888');

  static Color blue800 = fromHex('#0b5ed9');

  static Color black9003f = fromHex('#3f000000');

  static Color redA7004c = fromHex('#4cff0000');

  static Color redA7007f = fromHex('#7fff0000');

  static Color green50033 = fromHex('#334bc250');

  static Color lightGreen900 = fromHex('#2a6000');

  static Color black900 = fromHex('#000000');

  static Color lightGreen800 = fromHex('#47900d');

  static Color backgroundApp = fromHex('#bbe6ff');

  static Color redA70048 = fromHex('#48ff0000');

  static Color redA700Ad = fromHex('#adff0000');

  static Color redA70001 = fromHex('#b80000');

  static Color gray70068 = fromHex('#68696969');

  static Color whiteA700 = fromHex('#ffffff');

  static Color redA700 = fromHex('#ff0000');

  static Color blueA1005a = fromHex('#5a7eb3f2');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
