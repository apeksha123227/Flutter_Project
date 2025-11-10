import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridviewBuilder extends StatelessWidget {
  const StaggeredGridviewBuilder({super.key});

  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red 0-255
      random.nextInt(256), // Green 0-255
      random.nextInt(256),
    ); // Blue 0-255)
  }

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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            " Staggered Gridview Builder Examples",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          backgroundColor: Colors.pink,
          leading: Icon(Icons.arrow_back, size: 20, color: Colors.white),
          elevation: 5,
        ),
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
                  child: MasonryGridView.count(crossAxisCount: 3,
                      // Number of columns
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      itemCount: wallpaper_Image.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: getRandomColor(), width: 5),
                            //  borderRadius: BorderRadius.circular(30)
                          ),
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(wallpaper_Image[index]),
                          ),
                        );
                      })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
