import 'dart:math';

import 'package:flutter/material.dart';

import '../../Common Functions/Common_Functions.dart';

class GridviewBuilder extends StatelessWidget {
  const GridviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> wallpaper_Image = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.pexels.com/photos/34950/pexels-photo.jpg',
    ];

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Gridview Builder Examples"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Wallpaper Images",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: wallpaper_Image.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,

                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Common_Functions.getRandomColor()
                          , width: 5),
                      //  borderRadius: BorderRadius.circular(30)
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(wallpaper_Image[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
