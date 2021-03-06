import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:todo_app/cubit/edit_todo_cubit.dart';
import 'package:todo_app/data/models/todo.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;
  final _controller = TextEditingController();

  EditTodoScreen({Key key, this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _controller.text = todo.todoMessage;
    return BlocListener<EditTodoCubit, EditTodoState>(
      listener: (context, state) {
        if (state is TodoEdited) {
          Navigator.pop(context);
        } else if (state is EditTodoError) {
          Toast.show(state.error, context,
              duration: 2,
              backgroundColor: Colors.indigo,
              gravity: Toast.CENTER);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Edit Todo'),
            actions: [
              InkWell(
                onTap: () {
                  BlocProvider.of<EditTodoCubit>(context).deleteTodo(todo);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.delete),
                ),
              ),
            ],
          ),
          body: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _controller,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<EditTodoCubit>(context)
                  .updateTodo(todo, _controller.text);
            },
            child: _updateBtn(context),
          ),
        ],
      ),
    );
  }

  Widget _updateBtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.indigo[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          "Update Todo",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
