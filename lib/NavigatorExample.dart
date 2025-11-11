import 'package:flutter/material.dart';

import 'CommonFunctions.dart';
import 'DisplayScren.dart';
import 'SignInSignUp.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Commonfunctions.CommonAppBar(context, "Navigator Example"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInSignUp()),
                );
              },
              child: Text("Navigator push "),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Navigator pop"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/display',
                arguments:
                'Hello Display \n\n Navigator pushNamed Called',
              );
            },
            child: Text("Navigator pushNamed"),
          ),
        ],
      ),
    );
  }
}
