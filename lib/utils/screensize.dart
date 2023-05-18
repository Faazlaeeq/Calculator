import 'package:flutter/material.dart';

ScreenWidth(double val, BuildContext context) {
  return MediaQuery.of(context).size.width * val;
}

ScreenHeight(double val, BuildContext context) {
  return MediaQuery.of(context).size.height * val;
}
