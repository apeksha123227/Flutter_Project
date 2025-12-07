import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/AppColors.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:flutter_practice/Tasks/Quiz/Quiz_HomeScreen.dart';
import 'package:get/get.dart';

import 'ScoreScreen.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final questionController = Get.put(Question_Controller());

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    var lastindex = questionController.questionList.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            questionController.getName.value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          );
        }),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 20, color: Colors.black),
        ),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              var item = questionController.currentId.value;
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Question: ${item + 1}/${questionController.totalQuestions}",
                              style: TextStyle(
                                fontSize: 15,
                                /* color: AppColors.textBlue,*/
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Quit",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Obx(() {
                        return Text(
                          "${item + 1} .  ${questionController.questionList[item]["question"]}",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 5, // or null for unlimited
                          overflow: TextOverflow.visible,
                        );
                      }),

                      SizedBox(height: 15),

                      Obx(() {
                        List options =
                            questionController.questionList[item]["options"];

                        return Column(
                          children: List.generate(options.length, (index) {
                            bool isSelected =
                                questionController.selectedAns[item] == index;

                            return InkWell(
                              onTap: () {
                                questionController.selectedOption(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7,
                                ),
                                child: Card(
                                  elevation: 3,
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.white,

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      options[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    questionController.previous();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Previous",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),

                Obx(() {
                  return questionController.currentId.value == lastindex
                      ? ElevatedButton(
                          onPressed: () {
                            questionController.totalQuestions;
                            questionController.getScore();
                            questionController.selectedAns.refresh();
                            Get.to(ScoreScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            questionController.next();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Question Controller

class Question_Controller extends GetxController {
  final quizController = Get.find<QuizHome_Controller>();

  RxString getName = "".obs;
  RxInt currentId = 0.obs;

  RxList<Map<String, dynamic>> questionList = <Map<String, dynamic>>[
    {
      "question":
          "Which widget is used for creating a scrollable list in Flutter?",
      "options": ["Column", "ListView", "Row", "Container"],
      "answer": "ListView",
    },
    {
      "question": "Which programming language is used to write Flutter apps?",
      "options": ["Java", "Kotlin", "Dart", "Swift"],
      "answer": "Dart",
    },
    {
      "question": "What is the purpose of the `setState()` method?",
      "options": [
        "To rebuild UI after data changes",
        "To navigate between screens",
        "To store data permanently",
        "To add animations",
      ],
      "answer": "To rebuild UI after data changes",
    },
    {
      "question": "Which widget is used to display images in Flutter?",
      "options": ["Image", "Text", "Stack", "AppBar"],
      "answer": "Image",
    },
    {
      "question": "Which state management solution is built into Flutter?",
      "options": ["Redux", "GetX", "Provider", "InheritedWidget"],
      "answer": "InheritedWidget",
    },
    {
      "question": "Which widget is used to display text in Flutter?",
      "options": ["Button", "Text", "Label", "Title"],
      "answer": "Text",
    },
    {
      "question": "What does hot reload do in Flutter?",
      "options": [
        "Rebuilds only changed widgets",
        "Rebuilds entire app",
        "Clears app data",
        "Restarts IDE",
      ],
      "answer": "Rebuilds only changed widgets",
    },
  ].obs;

  int get totalQuestions => questionList.length;
  RxList<int> selectedAns = <int>[].obs;

  void next() {
    if (currentId < totalQuestions - 1) {
      currentId++;
    }
  }

  void selectedOption(int index) {
    selectedAns[currentId.value] = index;
    selectedAns.refresh();
  }

  void previous() {
    if (currentId > 0) {
      currentId--;
    }
  }

  /*

  bool isAnsCorrect(int questionId) {
    RxInt selectedIndex = selectedAns[questionId].obs;
    RxString selectedText =
        questionList[questionId]["options"][selectedIndex].obs;
    RxString correctAns = questionList[questionId]["answer"];

    if (selectedIndex == -1) {
      return false;
    }

    return selectedText == correctAns;
  }
*/

  int getScore() {
    int score = 0;

    for (int i = 0; i < questionList.length; i++) {
      int selectedIndex = selectedAns[i];
      String selectedAnswer = questionList[i]["options"][selectedIndex];
      String correctAnswer = questionList[i]["answer"];

      if (selectedIndex == -1) continue;

      if (selectedAnswer == correctAnswer) {
        score++;
      }
    }
   // selectedAns.refresh();

    return score;
  }

  @override
  void onInit() {
    super.onInit();
    getName.value = quizController.selectedName.value;
    selectedAns.value = List.generate(questionList.length, (_) => -1);
  }
}
