import 'package:flutter/material.dart';
import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:flutter_practice/Topics%20to%20covered/Topics/Sqlite/SqliteExample_Controller.dart';
import 'package:get/get.dart';

class SqliteExample extends StatelessWidget {
  SqliteExample({super.key});

  final sqliteExample_Controller = Get.put(SqliteExample_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common_Functions.GetAppBar(context, "Topics HomeScreen"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return getBottomshit(context);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          child: Obx(
            () => sqliteExample_Controller.userList.isEmpty
                ? const Center(child: Text("No data found"))
                : ListView.builder(
                    itemCount: sqliteExample_Controller.userList.length,
                    itemBuilder: (context, index) {
                      final user = sqliteExample_Controller.userList[index];
                      return ListTile(
                        title: Text(user.name ?? ""),
                        subtitle: Text("Age: ${user.age.toString()}"),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  void getBottomshit(BuildContext context) {
    Get.bottomSheet(
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Add Details"),
              TextField(
                controller: sqliteExample_Controller.nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: sqliteExample_Controller.ageController,
                decoration: InputDecoration(labelText: "Age"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  sqliteExample_Controller.adduser();
                  Get.back();
                },
                child: Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
