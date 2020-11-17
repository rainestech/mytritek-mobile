import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  // Create a singleton
  DBProvider._();

  static final DBProvider db = DBProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Get the location of our app directory. This is where files for our app,
    // and only our app, are stored. Files in this directory are deleted
    // when the app is deleted.
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'data.db');

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // Create the note table
      await db.execute('''
                CREATE TABLE user(
                    id INTEGER PRIMARY KEY,
                    username TEXT DEFAULT '',
                    lastName TEXT DEFAULT '',
                    firstName TEXT DEFAULT '',
                    email TEXT DEFAULT '',
                    phoneNo TEXT DEFAULT '',
                    token TEXT DEFAULT ''
                    passport TEXT DEFAULT ''
                    createdAt INTEGER DEFAULT 0,
                    updatedAt INTEGER DEFAULT 0',
                );
                
                CREATE TABLE customerCare(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    rank TEXT DEFAULT '',
                    phoneNo TEXT DEFAULT '',
                    available TEXT DEFAULT '',
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                );
                
                CREATE TABLE instructor(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    rank TEXT DEFAULT '',
                    about BLOB DEFAULT '',
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                );
                
                CREATE TABLE subs(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    price TEXT DEFAULT '',
                    properties BLOB,
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                );
                
                CREATE TABLE course(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    image TEXT DEFAULT '',
                    rating TEXT DEFAULT '',
                    noOfRatings TEXT DEFAULT '',
                    description BLOB,
                    properties BLOB,
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                    instructorId INTEGER',
                );
                
                CREATE TABLE lessons(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    video TEXT DEFAULT '',
                    local TEXT DEFAULT '',
                    category TEXT DEFAULT '',
                    noOfRatings TEXT DEFAULT '',
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                );
                
                CREATE TABLE ratings(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT '',
                    rating BLOB DEFAULT '',
                    passport TEXT DEFAULT '',
                    details BLOB DEFAULT '',
                    courseId INTEGER FOREIGN KEY
                    created_at INTEGER DEFAULT 0,
                    updated_at INTEGER DEFAULT 0',
                )
            ''');
    });
  }
}
