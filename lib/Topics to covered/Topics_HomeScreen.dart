import 'package:flutter/material.dart';
import 'package:flutter_practice/Tasks/To%20Do/Using%20GetX/To_Do_Screen_GetX.dart';

import '../Common Functions/Common_Functions.dart';
import 'Topics/Buttons.dart';

import 'Topics/GridviewBuilder.dart';
import 'Topics/Init_Screen.dart';
import 'Topics/Layoutbuilder.dart';
import 'Topics/ListBuilder.dart';
import 'Topics/NavigatorExample.dart';
import 'Topics/SetStateExample.dart';

import 'package:flutter_practice/Topics%20to%20covered/Topics/Responsive.dart';
import 'package:flutter_practice/Topics%20to%20covered/Topics/StaggeredGridviewBuilder.dart';

class Topics_HomeScreen extends StatelessWidget {
  const Topics_HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    final topics = [
      'Buttons',
      'Gridview',
      'LayoutBuilder',
      'ListViewBuilder',
      'Responsive',
      'Staggered GridView',
      'Navigator',
      'SetState',
      'GetX',
      'Init & refresh',
    ];

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Topics HomeScreen"),

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
                      MaterialPageRoute(builder: (context) => Layoutbuilder()),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Listbuilder()),
                    );
                  } else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Responsive()),
                    );
                  } else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaggeredGridviewBuilder(),
                      ),
                    );
                  } else if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigatorExample(),
                      ),
                    );
                  } else if (index == 7) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetStateExample(),
                      ),
                    );
                  } else if (index == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => To_Do_Screen_GetX(),
                      ),
                    );
                  } else if (index == 9) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard_Screen()),
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
