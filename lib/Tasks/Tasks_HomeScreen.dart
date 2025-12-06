import 'package:flutter/material.dart';
import 'package:flutter_practice/Tasks/Login/LoginScreen.dart';
import 'package:flutter_practice/Tasks/SignIn_Signup/SignInSignUp.dart';
import 'package:flutter_practice/Tasks/To%20Do/To_Do_HomeScreen.dart';

import '../Common Functions/Common_Functions.dart';
import 'Quiz/Quiz_HomeScreen.dart';
import 'To Do/Using SetState/To_Do_Screen_SetState.dart';

class Tasks_HomeScreen extends StatefulWidget {
  const Tasks_HomeScreen({super.key});

  @override
  State<Tasks_HomeScreen> createState() => _Tasks_HomeScreenState();
}

class _Tasks_HomeScreenState extends State<Tasks_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    final topics = ['Login', 'SignIn SignUp', 'To Do', 'Quiz'];

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Tasks HomeScreen"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),

        child: Container(
          width: screen_Width,
          height: screen_Height,
          child: ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInSignUp()),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => To_Do_HomeScreen(),
                      ),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Quiz_HomeScreen(),
                      ),
                    );
                  }
                },
                child: Card(
                  color: Common_Functions.getRandomColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.pink, width: 1),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        topics[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
