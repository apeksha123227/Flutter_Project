import 'dart:math';

import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> human_Names = [
      'Aarav',
      'Aanya',
      'Aditya',
      'Aditi',
      'Aisha',
      'Akash',
      'Alisha',
      'Aarav',
      'Aanya',
      'Aditya',
      'Aditi',
      'Aisha',
      'Akash',
      'Alisha',
    ];
    List<String> wallpaper_Image = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    ];

    return  Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Buttons Example"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Stack Example",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: wallpaper_Image.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      children: [
                        Stack(
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
                            /*CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  wallpaper_Image[index],
                                ),
                              ),*/
                          ],
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

            Center(
              child: Text(
                "Elevated Button",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            ElevatedButton(onPressed: () {}, child: Text("ELevated Button")),

            SizedBox(height: 5),
            Center(
              child: Text(
                "Text Button",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(onPressed: () {}, child: Text("Text Button")),

            SizedBox(height: 5),
            Center(
              child: Text(
                "Icon Button",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: Text("Icon Button")),

            SizedBox(height: 5),
            Center(
              child: Text(
                "Floating Button",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),

            SizedBox(height: 5),
            Center(
              child: InkWell(
                onTap: () {},
                child: Text(
                  "Inkwell Example",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
