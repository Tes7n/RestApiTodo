import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/presentation/screens/edit_todo_screen.dart';
import 'screens/todos_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => TodosScreen(),
        );
        break;

      case '/addTodo':
        return MaterialPageRoute(
          builder: (_) => AddTodo(),
        );
        break;

      case '/editTodo':
        return MaterialPageRoute(
          builder: (_) => EditTodo(),
        );
        break;

      default:
        return null;
    }
  }
}
