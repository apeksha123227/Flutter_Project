import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice/CommonFunctions.dart';
import 'package:flutter_practice/InstagramSignUp.dart';
import 'package:flutter_practice/LoginScreen.dart';
import 'package:flutter_practice/Responsive.dart';
import 'package:flutter_practice/StaggeredGridviewBuilder.dart';

import 'Buttons.dart';
import 'GridviewBuilder.dart';
import 'Layoutbuilder.dart';
import 'ListBuilder.dart';
import 'NavigatorExample.dart';
import 'SetStateExample.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;
    final topics = [
      'Buttons',
      'Gridview',
      'Instagram Sign Up',
      'LayoutBuilder',
      'ListViewBuilder',
      'LoginScreen',
      'Responsive',
      'Staggered GridView',
      'Navigator',
      'SetState',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Topics to Cover",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          backgroundColor: Colors.pink,
          leading: Icon(Icons.drag_handle, size: 20, color: Colors.white),
          elevation: 5,
        ),
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
                        MaterialPageRoute(builder: (context) => Buttons()),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GridviewBuilder(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstagramSignUp(),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Layoutbuilder(),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Listbuilder()),
                      );
                    } else if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    } else if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Responsive()),
                      );
                    } else if (index == 7) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaggeredGridviewBuilder(),
                        ),
                      );
                    } else if (index == 8) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigatorExample(),
                        ),
                      );
                    } else if (index == 9) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetStateExample(),
                        ),
                      );
                    }
                  },
                  child: Card(
                    color: Commonfunctions.getRandomColor(),
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
      ),
    );
  }
}
