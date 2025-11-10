import 'package:flutter/material.dart';

import 'CommonFunctions.dart';

class SetStateExample extends StatelessWidget {
  const SetStateExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Commonfunctions.CommonAppBar(context, "SetState Examples"),

      ),
    );
  }
}
