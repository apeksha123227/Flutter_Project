import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/AppColors.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:get/get.dart';
import 'package:svg_image/svg_image.dart';

import 'QuestionScreen.dart';

class Quiz_HomeScreen extends StatelessWidget {
  Quiz_HomeScreen({super.key});

  final quizController = Get.put(QuizHome_Controller(),permanent: true);

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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgImage(
                'assets/images/quizImg.svg',
                type: PathType.assets,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                "Categories",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: quizController.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = quizController.items[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              quizController.selectedName.value = item["name"];
                             // quizController.selectedIcon.value = item["icon"];
                              Get.to(QuestionScreen());
                            },
                            child: Card(
                             // color: AppColors.blue,
                              color: Colors.blue,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgImage(
                                  item["icon"],
                                  type: PathType.assets,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            item["name"],
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//QuizHome Controller

class QuizHome_Controller extends GetxController {
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {"icon": "assets/images/html.png", "name": "HTML"},
    {"icon": "assets/images/java.png", "name": "JAVASCRIPT"},
    {"icon": "assets/images/react.png", "name": "REACT"},
    {"icon": "assets/images/c++.png", "name": "C++"},
    {"icon": "assets/images/python.png", "name": "PYTHON"},
  ].obs;
  RxString selectedName = "".obs;

/*
  void onRefresh() {
    items.refresh();
  }*/
}
