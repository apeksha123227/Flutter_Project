import 'package:flutter/material.dart';

import 'CommonFunctions.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Commonfunctions.CommonAppBar(context, "Navigator Examples"),

      ),
    );
  }
}
