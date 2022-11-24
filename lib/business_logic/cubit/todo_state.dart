part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {
  final List<Todo> todos;

  TodoInitial(this.todos);
}

class TodoAdd extends TodoState {}

class TodoRemove extends TodoState {}

// abstract class TodoState extends Equatable {
//   const TodoState();
//
//   @override
//   List<Object> get props => [];
// }

//
// class InitDatabaseState extends DatabaseState {}
// class LoadDatabaseState extends DatabaseState {}
