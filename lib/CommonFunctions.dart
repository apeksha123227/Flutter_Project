import 'dart:math';

import 'package:flutter/material.dart';

class Commonfunctions {
  static Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red 0-255
      random.nextInt(256), // Green 0-255
      random.nextInt(256),
    ); // Blue 0-255)
  }

  static CommonAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
      backgroundColor: Colors.pink,
     // automaticallyImplyLeading: true,

      // automaticallyImplyLeading=true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
      ),
      elevation: 5,
    );
  }
}
