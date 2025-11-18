import 'package:flutter/material.dart';

import '../Common Functions/Common_Functions.dart';
import 'Calculator/Calculator_Screen.dart';

class Projects_Homescreen extends StatelessWidget {
  const Projects_Homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    final topics = [
      'Calculator',

    ];

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Projects HomeScreen"),

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
                      MaterialPageRoute(builder: (context) => Calculator_Screen()),
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
