import 'package:flutter/material.dart';

class AppColors {
  String appbarColor = "#4496AC";
  String orange = "#EF7F1B";
  String liteGrey = "#EDEDED";
  String hintColor = "#8F8F8F";
  String pinkColor = "#F3D8DA";
  String maroonColor = "#883E41";
  String golden = "#C5AF68";
}

class GetColor {
  String? hexColor;
  getColorFromHex(hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
