import 'dart:io';

import 'package:personal_toolbox/database/sql/phoneBook.dart';
import 'package:personal_toolbox/database/sql/todoTable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBProvider {
  static const DBName = "PersonalToolbox.DB";
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await openDB();
    return _database;
  }

  createDB(Database db, int version) async {
    await db.execute("$createTodoTable$createPhoneBookTable");
  }

  openDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DBName);
    return await openDatabase(path,
        version: 1, onOpen: (db) {}, onCreate: createDB);
  }
}
