import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Buttons.dart';
import 'GridviewBuilder.dart';
import 'HomeScreen.dart';
import 'Layoutbuilder.dart';
import 'ListBuilder.dart';
import 'LoginScreen.dart';
import 'Responsive.dart';
import 'StaggeredGridviewBuilder.dart';
import 'InstagramSignUp.dart';

void main() {
  runApp(const Myapp_31_Oct_Task());
}

class Myapp_31_Oct_Task extends StatelessWidget {
  const Myapp_31_Oct_Task({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
