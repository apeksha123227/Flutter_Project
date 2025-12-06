import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:flutter_practice/Topics%20to%20covered/Topics/Init_Screen.dart';
import 'package:get/get.dart';

class SelectedItemScreen extends StatelessWidget {
  const SelectedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIdController = Get.put(SelectedItemController());

    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Selected Id "),
      body: Container(
        child: Center(
          child: Text(
            selectedIdController.getId.value,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

//SelectedItem Controller

class SelectedItemController extends GetxController {
  final dashboardController = Get.find<Dashboard>();
  RxString getId = "".obs;

  void onInit() {
    super.onInit();
    getId.value = dashboardController.selectedId.value ;
  }
}
