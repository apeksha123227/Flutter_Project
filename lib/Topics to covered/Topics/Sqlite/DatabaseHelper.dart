import 'dart:io';
import 'dart:math';

import 'package:flutter_practice/Topics%20to%20covered/Topics/Sqlite/Model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? database;
  static final String tableName = "UserDetails";

  DatabaseHelper._internal();

  //create

  Future<void> createTable(Database data) async {
    await data.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      )
    ''');
  }

  //init & create table

  Future<Database> init() async {
    if (database != null) return database!;
    final data = await getDatabasesPath();
    // final dir = Directory("/storage/emulated/0/Download");
    print("path => ${data}");
    String path = join(data, 'testUserDetails.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (data, version) {
        createTable(data);
      },
    );

    return database!;
  }

  //insert
  Future<int> insert(Model model) async {
    final db = await init();
    final data = await db.insert(tableName, model.tomap());

    return data;
  }

  //get data

  Future<List<Model>> getData() async {
    final db = await init();
    final data = await db.query(tableName);
    return data.map((e) => Model.fromMap(e)).toList();
  }

  //delete

  Future<int> delete(int id) async {
    final db = await init();
    final data = await db.delete(tableName, where: 'id =?', whereArgs: [id]);
    return data;
  }
}
