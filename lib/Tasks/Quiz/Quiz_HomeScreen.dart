import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:get/get.dart';
import 'package:svg_image/svg_image.dart';

class Quiz_HomeScreen extends StatelessWidget {
  const Quiz_HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, " Quiz App"),
      body: Container(
        height: screen_height,
        width: screen_width,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SvgImage(
                'assets/images/quizImg.svg',
                type: PathType.assets,
                fit: BoxFit.cover,
              ),
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              /* Obx(() {
                return*/
              Expanded(child: ListView.builder(itemBuilder: (context, index) {})),
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
