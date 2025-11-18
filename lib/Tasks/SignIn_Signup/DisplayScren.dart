import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';


class Displayscren extends StatefulWidget {
  const Displayscren({super.key});

  @override
  State<Displayscren> createState() => _DisplayscrenState();
}

class _DisplayscrenState extends State<Displayscren> {
  @override
  Widget build(BuildContext context) {
    String arg = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "DisplayScreen"),
      body: Container(
        alignment: Alignment.center,
        child: Center(child: Text(arg, style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
