import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Tasks/SignIn_Signup/DisplayScren.dart';
import 'HomeScreen.dart';
import 'Tasks/SignIn_Signup/SignIn.dart';

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
      routes: {
        '/display': (context) => Displayscren(),
        '/Password': (context) => SignIn(),
      },
    );
  }
}
