import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  double getDynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double getDynamicWidth(double val) => MediaQuery.of(this).size.width * val;
}