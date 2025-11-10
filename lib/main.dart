import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Buttons.dart';
import 'GridviewBuilder.dart';
import 'Layoutbuilder.dart';
import 'ListBuilder.dart';
import 'LoginScreen.dart';
import 'List.dart';
import 'Responsive.dart';
import 'StaggeredGridviewBuilder.dart';
import 'InstagramSignUp.dart';

void main() {
  runApp(const Myapp_31_Oct_Task());
}

//TEXT
/*class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello Apeksha",style: TextStyle(
            fontSize: 20,
            color: Colors.amber,
            letterSpacing: 2,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w900,

          ),),
        ),
      ),
    );
  }
}*/

//IMAGE
/*
class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Image",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        body: Column(
          children: [
            Text("Image from URL "),
            SizedBox(height: 10),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amberAccent, width: 4),
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.pexels.com/photo/green-and-blue-peacock-feather-674010/",
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("Image from Icon "),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(color: Colors.black, Icons.insert_emoticon_outlined),
                  Icon(color: Colors.red, Icons.holiday_village),
                  Icon(color: Colors.green, Icons.safety_check),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text("Image from Assets "),
            SizedBox(height: 10),
            Container(
              child: Image.asset('sample_640×426.jpeg',
              height: 200,
              width: 200,)
            )
          ],
        ),
      ),
    );
  }
}*/

//ROW COLUM
/*class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Only Row And Colmns")),
        body: Center(
          child: Column(
            children: [
              Text("A"),
              Text("B"),
              Text("C"),
            ],
          ),
        ),
      ),
    );
  }
}*/

// Task

class Myapp_31_Oct_Task extends StatelessWidget {
  const Myapp_31_Oct_Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Buttons(),
    );
  }
}
