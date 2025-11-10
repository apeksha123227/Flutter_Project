import 'package:flutter/material.dart';

import 'CommonFunctions.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    double screen_Width = MediaQuery.of(context).size.width;
    double screen_Height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: Commonfunctions.CommonAppBar(context, "Responsive Examples"),

        body: Container(
          width: screen_Width * 0.5,
          height: screen_Height * 0.9,
          color: Colors.black,
          child: Center(
            child: Text(
              "data",
              style: TextStyle(
                fontSize: screen_Width * 0.1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
