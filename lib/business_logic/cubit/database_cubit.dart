import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());
  Database? database;

  // Future<Database?> get db async {
  //   if (database == null) {
  //     database = await initDatabase();
  //     return database;
  //   }
  //   return database;
  // }

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    // print(databasePath);
    final path = join(databasePath, 'todo.db');
    if (await Directory(dirname(path)).exists()) {
      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db
            .execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT)');
      });
      emit(DatabaseLoaded(database));
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
        database = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db
              .execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT)');
        });
        emit(DatabaseLoaded(database));
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
