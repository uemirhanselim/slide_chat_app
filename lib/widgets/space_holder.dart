import 'package:flutter/material.dart';

Widget emptySpaceHeight(BuildContext context, double value) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * value,
  );
}

Widget emptySpaceWidth(BuildContext context, double value) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * value,
  );
}
