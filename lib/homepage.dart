import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialogBox.dart';
import 'package:to_do_app/util/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ['Make tutorial', false],
    ['Do Exercise', true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialogbox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'To Do',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          )),
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 250, 240, 145),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 217, 200, 44),
          foregroundColor: Colors.black,
        ));
  }
}
