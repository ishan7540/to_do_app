import 'package:hive_flutter/hive_flutter.dart';

class ToDoBase {
  List toDoList = [];
  // method if this is first time opening this app
  void createInitialData() {
    List toDoList = [
      ['Make tutorial', false],
      ['Do Exercise', true],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update data form databse

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }

  final _myBox = Hive.box('myBox');
}
