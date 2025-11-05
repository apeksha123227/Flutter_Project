import 'package:flutter/material.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Icon(Icons.sports_baseball, size: 40,),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Sports India", style: TextStyle(
                                  fontSize: 18, color: Colors.black),),
                            ),
                            Icon(Icons.check_circle_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Icon(Icons.science, size: 40,),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Science India", style: TextStyle(
                                  fontSize: 18, color: Colors.black),),
                            ),
                            Icon(Icons.check_circle_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),),
              SizedBox(height: 10),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black12,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Icon(Icons.newspaper, size: 40,),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("News India", style: TextStyle(
                                  fontSize: 18, color: Colors.black),),
                            ),
                            Icon(Icons.check_circle_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
