import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:get/get.dart';

class To_Do_Screen_GetX extends StatelessWidget {
  const To_Do_Screen_GetX({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    final logical_controller = Get.put(Logical_Controller());

    //Add Item

    void getBottomSheet_AddItem(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Add Tasks",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        logical_controller.task_Controller.clear();
                        Get.back();
                      },
                      child: Icon(
                        Icons.cancel_outlined,
                        color: Colors.pink,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextField(
                  maxLines: 1,
                  controller: logical_controller.task_Controller,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.pink,
                  decoration: InputDecoration(
                    hintText: "Add Task",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    if (logical_controller.task_Controller.text.isNotEmpty) {
                      logical_controller.addTask(
                        logical_controller.task_Controller.text,
                      );
                      logical_controller.task_Controller.clear();
                      //  Navigator.pop(context);
                      Get.back();
                    }
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "TO DO"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logical_controller.getDateTime();
          getBottomSheet_AddItem(context);
        },
        child: Icon(Icons.add_circle, size: 40, color: Colors.pink),
      ),
      body: Container(
        height: screen_height,
        width: screen_width,
        child: Obx(() {
          if (logical_controller.todo_items.isEmpty) {
            return Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: logical_controller.todo_items.length,
              itemBuilder: (context, index) {
                final item = logical_controller.todo_items[index];
                return Dismissible(
                  key: ValueKey(item),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    logical_controller.removeTask(index);
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  logical_controller.todo_items[index]["task"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Date ${logical_controller.todo_items[index]["date"]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                Text(
                                  "Time ${logical_controller.todo_items[index]["time"]}",
                                  //"Time: ${item[logical_controller.currentTime]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          /* Obx((){
                            return ;
                          }),*/
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Checkbox(
                                  value: logical_controller
                                      .todo_items[index]["checked"],
                                  activeColor: Colors.pink,
                                  side: BorderSide(
                                    color: Colors.pink,
                                    width: 2,
                                  ),
                                  onChanged: (value) {
                                    logical_controller.checkBox_is_checked(
                                      index,
                                      value!,
                                    );
                                  },
                                ),

                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) {
                                        logical_controller
                                            .task_Controller
                                            .text = logical_controller
                                            .todo_items[index]["task"];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(
                                              context,
                                            ).viewInsets.bottom,
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Update Your Tasks",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Icon(
                                                      Icons.cancel_outlined,
                                                      color: Colors.pink,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30),
                                              TextField(
                                                maxLines: 1,
                                                controller: logical_controller
                                                    .task_Controller,
                                                textAlign: TextAlign.start,
                                                cursorColor: Colors.pink,
                                                decoration: InputDecoration(
                                                  hintText: logical_controller
                                                      .task_Controller
                                                      .text,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.pink,
                                                ),
                                                onPressed: () {
                                                  if (logical_controller
                                                      .task_Controller
                                                      .text
                                                      .isNotEmpty) {
                                                    logical_controller
                                                        .updateTask(
                                                          index,
                                                          logical_controller
                                                              .task_Controller
                                                              .text,
                                                        );
                                                    logical_controller
                                                        .task_Controller
                                                        .clear();
                                                    Get.back();
                                                  }
                                                },
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    logical_controller.removeTask(index);
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

// Logical Part of To Do

class Logical_Controller extends GetxController {
  RxList<Map<String, dynamic>> todo_items = <Map<String, dynamic>>[].obs;
  TextEditingController task_Controller = Get.put(TextEditingController());
  late BuildContext context;

  //Date And Time

  var currentDate = "".obs;
  var currentTime = "".obs;

  void getDateTime() {
    DateTime now = DateTime.now();
    currentDate.value = "${now.day}-${now.month}-${now.year}";
    currentTime.value = "${now.hour}:${now.minute}";
  }

  void addTask(String text) {
    todo_items.add({
      "task": text,
      "date": currentDate.value,
      "time": currentTime.value,
      "checked": false,
    });
  }

  void removeTask(int id) {
    todo_items.removeAt(id);
  }

  void updateTask(int id, String newtext) {
    todo_items[id]["task"] = newtext;
  }

  void checkBox_is_checked(int id, bool value) {
    todo_items[id]["checked"] = value;
    Get.snackbar("", "Task Completed", snackPosition: SnackPosition.BOTTOM);
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Completed")));
    todo_items.refresh();

    if (value) {
      Future.delayed(Duration(milliseconds: 500), () {
        removeTask(id);
      });
    }
  }
}
