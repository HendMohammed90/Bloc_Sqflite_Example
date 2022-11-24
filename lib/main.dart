import 'package:block_sqflite/business_logic/cubit/database_cubit.dart';
import 'package:block_sqflite/business_logic/cubit/todo_cubit.dart';
import 'package:block_sqflite/presintation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DatabaseCubit>(
          create: (BuildContext context) => DatabaseCubit(),
        ),
        BlocProvider<TodoCubit>(
          create: (BuildContext context) => TodoCubit(),
        ),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
