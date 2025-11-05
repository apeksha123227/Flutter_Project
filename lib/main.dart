import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'List.dart';
import 'List.a';

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
      /* home: Scaffold(
        body: Column(
          children: [
            Text("Task 1"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.call, color: Colors.blue),
                    Text("Call", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.send, color: Colors.blue),
                    Text("Route", style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, color: Colors.blue),
                    Text("Call", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60),

            Text("Task 2"),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Strawberry Pavlova"),
                        SizedBox(height: 20),
                        Text(
                          "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. It features a crisp crust and soft, light inside, topped with fruit and whipped cream.",
                        ),
                        SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            SizedBox(width: 20),
                            Text("170 Reviews"),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.kitchen, color: Colors.green),
                                Text("PREP"),
                                SizedBox(height: 10),
                                Text("25 min"),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.timer, color: Colors.green),
                                Text("COOK"),
                                SizedBox(height: 10),
                                Text("1 hr"),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.restaurant, color: Colors.green),
                                Text("FEEDS"),
                                SizedBox(height: 10),
                                Text("4–6"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/pavlova-diagram.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),

            Text("Task 3"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Icon(Icons.garage)),
                Expanded(flex:2,child: Icon(Icons.garage)),
                Expanded(child: Icon(Icons.garage)),
              ],
            ),
          ],
        ),
      ),*/
      /*home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(onPressed: ()
                  {

                  }, child:   Text("Login", style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),))

            ],
          ),
        ),
      ),*/
      debugShowCheckedModeBanner: false,
      home: const a(),
    );
  }
}
