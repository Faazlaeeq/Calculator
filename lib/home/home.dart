import 'package:calculator/home/utils/circlebutton.dart';
import 'package:calculator/utils/screensize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();

  String oprtor = "";
  String old = "";
  int i = 0;
  int j = 0;
  enterNum(String num) {
    if (j == 1) {
      textEditingController.clear();
      j = 0;
    }
    textEditingController.text += num;
  }

  oprationSave(String key) {
    oprtor = key;

    old = textEditingController.text;
    if (i > 0) {
      cal();
      j = 1;
    } else {
      textEditingController.clear();
    }

    i++;
  }

  aC() {
    textEditingController.clear();
    i = 0;
    j = 0;
  }

  cal() {
    if (oprtor == "*") {
      textEditingController.text =
          (double.parse(old) * double.parse(textEditingController.text))
              .toString();
    } else if (oprtor == "+") {
      textEditingController.text =
          (double.parse(old) + double.parse(textEditingController.text))
              .toString();
    } else if (oprtor == "-") {
      textEditingController.text =
          (double.parse(old) - double.parse(textEditingController.text))
              .toString();
    } else if (oprtor == "/") {
      textEditingController.text =
          (double.parse(old) / double.parse(textEditingController.text))
              .toString();
    } else if (oprtor == "%") {
      textEditingController.text =
          (double.parse(old) % double.parse(textEditingController.text))
              .toString();
    }
  }

  clear() {
    String old1 = textEditingController.text;
    Characters txt = old1.characters;
    if (old1.isNotEmpty) {
      old1 = old1.replaceRange(txt.length - 1, txt.length, "");
    }

    textEditingController.text = old1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(children: [
          SizedBox(
            height: 100,
            width: ScreenWidth(1, context),
            child: TextFormField(
              readOnly: true,
              showCursor: false,
              decoration: InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.end,
              controller: textEditingController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
              ),
            ),
          ),
          SizedBox(
            height: ScreenHeight(.13, context),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(30),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                circleButton("C", () {
                  clear();
                }, context, color: Color(0xff1C1C1C), bgcolor: "D4D4D2"),
                circleButton("AC", () {
                  aC();
                }, context, color: Color(0xff1C1C1C), bgcolor: "D4D4D2"),
                circleButton("%", () {
                  oprationSave("%");
                }, context, color: Color(0xff1C1C1C), bgcolor: "D4D4D2"),
                circleButton("/", () {
                  oprationSave("/");
                }, context, color: Color(0xffffffff), bgcolor: "FF9500"),
                circleButton("7", () {
                  enterNum("7");
                }, context),
                circleButton("8", () {
                  enterNum("8");
                }, context),
                circleButton("9", () {
                  enterNum("9");
                }, context),
                circleButton("X", () {
                  oprationSave("*");
                }, context, color: Color(0xffffffff), bgcolor: "FF9500"),
                circleButton("4", () {
                  enterNum("4");
                }, context),
                circleButton("5", () {
                  enterNum("5");
                }, context),
                circleButton("6", () {
                  enterNum("6");
                }, context),
                circleButton("-", () {
                  oprationSave("-");
                }, context, color: Color(0xffffffff), bgcolor: "FF9500"),
                circleButton("1", () {
                  enterNum("1");
                }, context),
                circleButton("2", () {
                  enterNum("2");
                }, context),
                circleButton("3", () {
                  enterNum("3");
                }, context),
                circleButton("+", () {
                  oprationSave("+");
                }, context, color: Color(0xffffffff), bgcolor: "FF9500"),
                circleButton("0", () {
                  enterNum("0");
                }, context),
                circleButton("00", () {
                  enterNum("00");
                }, context),
                circleButton(".", () {
                  enterNum(".");
                }, context),
                circleButton("=", () {
                  cal();
                }, context, color: Color(0xffffffff), bgcolor: "FF9500"),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
