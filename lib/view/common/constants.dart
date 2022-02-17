import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF1E1E1E); //siyah renk
const kPrimaryColor = Color(0XFF4567AC); // mavi renk
const kWhiteTS = TextStyle(color: Colors.white);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.white54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Color(0xFF6b80ad)), //textfield dış çizgisi aktif değilken
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF2651ad)),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
