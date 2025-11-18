import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';
import '../../Tasks/SignIn_Signup/DisplayScren.dart';
import '../../Tasks/SignIn_Signup/SignInSignUp.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Navigator Example"),
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
