import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/Topics%20to%20covered/Topics/Sqlite/DatabaseHelper.dart';
import 'package:flutter_practice/Topics%20to%20covered/Topics/Sqlite/Model.dart';
import 'package:get/get.dart';

class SqliteExample_Controller extends GetxController {
  RxList<Model> userList = <Model>[].obs;
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    userList.value = await DatabaseHelper.instance.getData();
  }

  Future<void> adduser() async {
    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      Get.snackbar("Error", "Please enter all details");
      return;
    }
    final user = Model(
      name: nameController.text,
      age: int.parse(ageController.text),
    );
    await DatabaseHelper.instance.insert(user);
    print("User=> ${user}");
    nameController.clear();
    ageController.clear();

    fetchUsers();

    Get.snackbar("Success", "User added to database");
  }
}
