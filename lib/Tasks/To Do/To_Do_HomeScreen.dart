import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';
import 'Using GetX/To_Do_Screen_GetX.dart';
import 'Using SetState/To_Do_Screen_SetState.dart';

class To_Do_HomeScreen extends StatefulWidget {
  const To_Do_HomeScreen({super.key});

  @override
  State<To_Do_HomeScreen> createState() => _To_Do_HomeScreenState();
}

class _To_Do_HomeScreenState extends State<To_Do_HomeScreen> {
  @override

  Widget build(BuildContext context) {


    final screen_Width = MediaQuery.of(context).size.width;
    final screen_Height = MediaQuery.of(context).size.height;

    final topics = ['Using SetState', 'Using getX'];

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "To Do HomeScreen"),

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
                      MaterialPageRoute(builder: (context) => To_Do_Screen_SetState()),
                    );
                  }
                  else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => To_Do_Screen_GetX(),
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
