part of 'database_cubit.dart';

@immutable
abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoaded extends DatabaseState {
  DatabaseLoaded(Database? database);
}
//
// class InitDatabaseState extends DatabaseState {}
// class LoadDatabaseState extends DatabaseState {}
