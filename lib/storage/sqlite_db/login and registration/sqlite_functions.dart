import 'dart:async';

// import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql; //y typed as this

class SQLFunctions {
  //create database
  static Future<sql.Database> openOrCreateDb() async {
    return sql.openDatabase(
      "User",
      version: 1,
      onCreate: (sql.Database db, int version) async {
        await createTable(db);
      },
    );
  }

//creating table to store user data
  static Future<void> createTable(sql.Database db) async {
    await db.execute(
        'CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT, password TEXT)');
  }

  ///what is static?
//create a new user in the table
  static Future<int> addUser(String name, String email, String password) async {
    var db = await SQLFunctions.openOrCreateDb(); //to open database
    var data = {
      'name': name,
      'email': email,
      'password': password
    }; //keys are column names, values are values from TextFormField
    var id = db.insert('userdata', data);
    //or
    // var id = db.insert(
    //     'userdata', {'name': name, 'email': email, 'password': password});
    //infinite values veruva enkil  nmlk edh nadakila
    return id;
  }

//check if user exist in db
  static Future<List<Map>> checkUserExist(String email, String password) async {
    var db = await SQLFunctions.openOrCreateDb(); // to open database
    final data = await db.rawQuery(
        "SELECT * FROM userdata WHERE email ='$email' AND password ='$password'"); //start il double quotes and $ il ola single quotes il
    //rawQuery means crosschecking aa, ,means db il ondo enn cross cheyum
    if (data.isNotEmpty) {
      return data;
    } else {
      return data; //vnokil null kodukam, engane thane koduknm enn ila
    }
  }

//to check if user has already registered
  static Future<List<Map>> checkUserAlreadyRegistered(String email) async {
    var db = await SQLFunctions.openOrCreateDb(); // to open database
    final user =
        await db.rawQuery("SELECT * FROM userdata WHERE email ='$email'");
    if (user.isNotEmpty) {
      return user;
    } else {
      return user;
    }
  }

  //to read all the users from database(db)
  static Future<List<Map<String, dynamic>>> getAllUsersFromDB() async {
    var db = await SQLFunctions.openOrCreateDb();
    final allUsers = await db.rawQuery("SELECT * FROM userdata");
    return allUsers;
  }

// to delete all users from database
  static Future<void> deleteDataFromDB(int id) async {
    var db = await SQLFunctions.openOrCreateDb();
    db.delete('userdata', where: 'id = ?', whereArgs: [id]); //doubt
  }

  static Future<int> updateDetailsByUser(id, String name, String email) async {
    var db = await SQLFunctions.openOrCreateDb();
    final newData = {'name': name, 'email': email};
    final newID =
        await db.update('userdata', newData, where: 'id = ?', whereArgs: [id]);
    return newID;
    // final editedValue= db.query('userdata', where: 'name=$nameCntrler',whereArgs: [id]);
    // List<Map> maps = await db.query(tableTodo,
    //     columns: ['columnId', 'columnDone', 'columnTitle'],
    //     where: 'columnId = ?',
    //    whereArgs: [id]);
  }
}
