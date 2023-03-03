import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:knocksence_flutter_webapp/utils/color.dart';

class CommonToast {
  commonFlutterToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        backgroundColor: GetColor().getColorFromHex(AppColors().orange),
        toastLength: Toast.LENGTH_SHORT);
  }
}
