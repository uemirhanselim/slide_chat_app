import 'package:flutter/material.dart';
import 'package:slide_chat_app/helpers/color_helper.dart';

final AuthButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(
    ColorHelper.primaryColor,
  ),
  shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
);
