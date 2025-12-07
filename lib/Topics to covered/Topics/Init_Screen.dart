import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:get/get.dart';

import 'SelectedItemScreen.dart';

class Dashboard_Screen extends StatelessWidget {
  Dashboard_Screen({super.key});

  final dashboardController = Get.put(Dashboard(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Init & Refresh"),
      body: Container(
        child: Obx(() {
          return RefreshIndicator(
            onRefresh: () async{
              dashboardController.onRefresh();
            },
            child: ListView.builder(
              itemCount: dashboardController.item.length,
              itemBuilder: (context, index) {
                var item = dashboardController.item[index];
                return InkWell(
                  onTap: () {
                  //  dashboardController.selectedId.value = item;
                    Get.to(SelectedItemScreen());
                  },
                  child: ListTile(title: Text(item)),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

// Dashboard Controller

class Dashboard extends GetxController {
  RxList item = ["1", "2", "3", "4"].obs;
  RxString selectedId = "".obs;

  void onRefresh() {
    item.refresh();
    Get.snackbar("", "Data Refreshed", snackPosition: SnackPosition.BOTTOM);
  }
}
