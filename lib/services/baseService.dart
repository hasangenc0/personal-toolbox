import 'package:sqflite/sqlite_api.dart';

import '../database//db.dart';

class BaseService {
  Future<Database> get db async {
    return await database;
  }
}
