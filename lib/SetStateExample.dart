import 'package:flutter/material.dart';

import 'CommonFunctions.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  State<SetStateExample> createState() => _SetstateexampleState();
}

class _SetstateexampleState extends State<SetStateExample> {
  @override
  Widget build(BuildContext context) {
    List<String> wallpaper_Image = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    ];
    List<String> human_Names = ['Aarav'];


    return Scaffold(
      appBar: Commonfunctions.CommonAppBar(context, "SetState Examples"),

      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: wallpaper_Image.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF58529),
                              Color(0xFFDD2A7B),
                              Color(0xFF8134AF),
                              Color(0xFF515BD4),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                      Container(
                        width: 66,
                        height: 66,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(wallpaper_Image[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        human_Names[index],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          FloatingActionButton(
            onPressed: () {

              /* setState(() {
                });*/
            },
            child: Icon(Icons.add, color: Colors.pink, size: 40),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }


}
