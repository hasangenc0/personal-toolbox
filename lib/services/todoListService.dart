import 'package:personal_toolbox/database/sql/todoTable.dart';
import 'package:personal_toolbox/models/todoList.dart';
import 'package:sqflite/sqflite.dart';

import 'baseService.dart';

class TodoListService extends BaseService {
  final String table = TODO_LIST_TABLE_NAME;
  Future<bool> addItem(TodoItemModel item) async {
    Database db = await this.db;
    int result = await db.insert(table, item.getValue());

    return result > 0;
  }

  Future<bool> updateItem(TodoItemModel item) async {
    Database db = await this.db;
    int result =
        await db.update(table, item.getValue(), where: 'id = ${item.id}');

    return result > 0;
  }

  void delete() async {
    Database db = await this.db;
    int result = await db.delete(table);
  }

  Future<List<TodoItemModel>> getItems() async {
    Database db = await this.db;
    List<Map> result =
        await db.query(TODO_LIST_TABLE_NAME, orderBy: 'created_at DESC');
    List<TodoItemModel> items = List();
    result.forEach((element) {
      items.add(TodoItemModel(
          element['id'],
          element['title'],
          element['description'],
          element['done'] == 1,
          element['removed'] == 1));
    });

    return items;
  }
}
