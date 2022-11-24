import 'dart:developer';
import 'package:block_sqflite/data/models/todo.dart';
import 'package:sqflite/sqlite_api.dart';

class TodoRepository {
  Future<List<Todo>> getTodos({
    required Database database,
  }) async {
    final data = await database.rawQuery('SELECT * FROM todo');
    print('data are ${data}');
    List<Todo> todos = [];
    for (var item in data) {
      todos.add(Todo(item['id'] as int, item['name'] as String));
    }
    return todos;
  }

  Future<dynamic> addTodo({
    required Database database,
    required String text,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawInsert("INSERT INTO todo (name) VALUES ('$text')");
    });
  }

  Future<dynamic> removeTodo({
    required Database database,
    required int id,
  }) async {
    return await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM todo where id = $id');
    });
  }
}
