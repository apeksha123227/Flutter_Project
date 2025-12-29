import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/AppColors.dart';
import 'package:flutter_practice/Tasks/Quiz/QuestionScreen.dart';
import 'package:flutter_practice/Tasks/Quiz/Quiz_HomeScreen.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    final scoreController = Get.put(ScoreController());

    return Scaffold(
      body: Container(
        height: screen_height,
        width: screen_width,


        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 120),
              Screenshot(
                controller:scoreController. screenshotController,
                child: Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your Score",
                                  style: TextStyle(
                                    fontSize: 20,
                                    //color: AppColors.textBlue,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${scoreController.getScore.value}/${scoreController.questionController.totalQuestions}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    //color: AppColors.textBlue,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Congratulation",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          //color: AppColors.textBlue,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "Great job, You Did It",
                        style: TextStyle(
                          fontSize: 20,
                          //color: AppColors.textBlue,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  //captureAndShare();
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Share", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (() {
                    Get.to(Quiz_HomeScreen());
                    scoreController.questionController.selectedAns.clear();
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Back to Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

//ScoreController

class ScoreController extends GetxController {
  final questionController = Get.find<Question_Controller>();
  RxInt getScore = 0.obs;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getScore.value = questionController.getScore();
  }
}
