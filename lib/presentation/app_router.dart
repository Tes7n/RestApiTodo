import 'package:flutter/material.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/data/network_service.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/presentation/screens/edit_todo_screen.dart';
import 'screens/todos_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Repository repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                TodosCubit(repository: repository),
            child: TodosScreen(),
          ),
        );
        break;

      case Add_Todo_Route:
        return MaterialPageRoute(
          builder: (_) => AddTodo(),
        );
        break;

      case Edit_Todo_Route:
        return MaterialPageRoute(
          builder: (_) => EditTodo(),
        );
        break;

      default:
        return null;
    }
  }
}
