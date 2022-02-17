import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarWidget {
  static openSnackBar(String message, String title, bool isOk) {
    Get.snackbar(
      title,
      message,
      backgroundColor: isOk ? Colors.green : Colors.redAccent,
      colorText: Colors.white,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
