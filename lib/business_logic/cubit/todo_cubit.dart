import 'dart:developer';
import 'dart:io';
import 'package:block_sqflite/data/models/todo.dart';
import 'package:block_sqflite/data/repos/todo_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(TodoState TodoInitial, this.database) : super(TodoInitial);

  final _todoRebo = TodoRepository();
  final Database database;

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<List<Todo>> getTodos() async {
    _todos = await _todoRebo.getTodos(database: database);
    emit(TodoInitial(_todos));
    return _todos;
  }
}
