import 'package:flutter/material.dart';

Widget AuthTextField(
  TextEditingController controller,
  TextInputAction inputAction,
  InputDecoration decoration,
  TextInputType keyboardType,
  bool value,
) {
  return Flexible(
    child: TextField(
      textInputAction: inputAction,
      textAlign: TextAlign.center,
      obscureText: value,
      controller: controller,
      decoration: decoration,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
