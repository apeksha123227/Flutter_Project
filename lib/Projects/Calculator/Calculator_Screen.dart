import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';

class Calculator_Screen extends StatefulWidget {
  const Calculator_Screen({super.key});

  @override
  State<Calculator_Screen> createState() => _Calculator_ScreenState();
}

class _Calculator_ScreenState extends State<Calculator_Screen> {
  double num1 = 0;
  double num2 = 0;
  String operator = "";
  bool isSecond = false;

  double calculate(double n1, double n2, String op) {
    switch (op) {
      case "+":
        return n1 + n2;
      case "-":
        return n1 - n2;
      case "*":
        return n1 * n2;
      case "/":
        return n1 / n2;
      case "%":
        return n1 / n2;
      default:
        return 0;
    }
  }

  void removeOneDigit() {
    if (controller.text.isNotEmpty) {
      controller.text = controller.text.substring(
        0,
        controller.text.length - 1,
      );
    }
  }

  void buttonClick(String value) {
    setState(() {
      if (value == "AC") {
        controller.clear();
        num1 = 0;
        num2 = 0;
        operator = "";
        return;
      }
      if (value == "←") {
        removeOneDigit();
        return;
      }
      if (value == "+" ||
          value == "-" ||
          value == "*" ||
          value == "/" ||
          value == "%") {
        num1 = double.parse(controller.text);
        operator = value;
        isSecond = true;
        controller.text = "$num1 $value ";
        return;
      }
      if (value == "=") {
        num2 = double.parse(controller.text);
        double result = calculate(num1, num2, operator);
        controller.text = result.toString();
        return;
      }
      if (isSecond == true) {
        controller.text = value;
        isSecond = false;
      } else {
        controller.text += value;
      }
    });
  }

  Widget gebutButton(String num, Color color) {
    return InkWell(
      onTap: () {
        buttonClick(num);
      },
      child: Container(
        alignment: Alignment.center,
        width: 70,
        height: 70,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Text(
          num,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          selectionColor: Colors.green,
        ),
      ),
    );
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Calculator"),
      body: Container(
        alignment: Alignment.bottomCenter,
        height: screen_Height,
        width: screen_Width,
        color: CupertinoColors.systemGrey6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black26, width: 1),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),

                          child: TextField(
                            controller: controller,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            readOnly: true,
                            showCursor: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gebutButton("AC", CupertinoColors.systemGrey4),
                    gebutButton("%", CupertinoColors.systemGrey4),
                    gebutButton("←", CupertinoColors.systemGrey4),
                    gebutButton("/", CupertinoColors.systemGrey4),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gebutButton("7", Colors.white),
                    gebutButton("8", Colors.white),
                    gebutButton("9", Colors.white),
                    gebutButton("*", CupertinoColors.systemGrey4),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gebutButton("4", Colors.white),
                    gebutButton("5", Colors.white),
                    gebutButton("6", Colors.white),
                    gebutButton("-", CupertinoColors.systemGrey4),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gebutButton("1", Colors.white),
                    gebutButton("2", Colors.white),
                    gebutButton("3", Colors.white),
                    gebutButton("+", CupertinoColors.systemGrey4),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    gebutButton("00", Colors.white),
                    gebutButton("0", Colors.white),
                    gebutButton(".", Colors.white),
                    gebutButton("=", Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
