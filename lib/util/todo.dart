import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool taskCompleted;
  final String taskName;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25, left: 15, right: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: const EdgeInsetsDirectional.all(24),
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 247, 243, 207),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: Colors.black,
                hoverColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
