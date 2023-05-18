import 'package:calculator/utils/screensize.dart';
import 'package:flutter/material.dart';

circleButton(String text, Function func, BuildContext context,
    {Color color = const Color.fromARGB(255, 255, 255, 255),
    String bgcolor = "1C1C1C"}) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(int.parse("0xff$bgcolor"))),
      alignment: Alignment.center,
      child: TextButton(
          child: Text(
            text,
            style:
                TextStyle(fontSize: ScreenWidth(0.09, context), color: color),
          ),
          onPressed: () {
            func();
          }));
}
