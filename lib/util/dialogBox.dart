import 'package:flutter/material.dart';
import 'button.dart';

class Dialogbox extends StatefulWidget {
  dynamic controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  State<Dialogbox> createState() => _DialogboxState();
}

class _DialogboxState extends State<Dialogbox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                  focusColor: Colors.black,
                  border: OutlineInputBorder(),
                  hintText: "Add a new task"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: () {
                    widget.onSave();
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                MyButton(
                  text: 'Cancel',
                  onPressed: () {
                    widget.onCancel();
                  },
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
