import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  static String apiUrl() {
    return 'https://wameserver.herokuapp.com/';
  }

  static Map<String, String> httpJson() => {"Content-Type": "application/json"};

  static void snackError({@required String message}) {
    return Get.snackbar(
      'Gagal !',
      Utils.capitalize(message),
      overlayBlur: 0,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.redAccent,
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  static void snackSuccess({@required String message}) {
    return Get.snackbar(
      'Berhasil !',
      Utils.capitalize(message),
      overlayBlur: 0,
      margin: EdgeInsets.all(0),
      borderRadius: 0,
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  static String capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }
}
