import 'package:flutter/material.dart';

import '../models/student.dart';
import 'error_dialog.dart';

class DialogBox extends StatefulWidget {
  const DialogBox({
    super.key,
    required this.idx,
    required this.update,
  });

  final int idx;
  final Function update;

  @override
  DialogBoxState createState() => DialogBoxState();
}

class DialogBoxState extends State<DialogBox> {
  late Student student;

  TextEditingController ideationController = TextEditingController();
  TextEditingController executionController = TextEditingController();
  TextEditingController pitchController = TextEditingController();

  @override
  void initState() {
    student = studentList[widget.idx];
    ideationController.text = student.ideation.toString();
    executionController.text = student.execution.toString();
    pitchController.text = student.pitch.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Score'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: ideationController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Ideation',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: executionController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Execution',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: pitchController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Pitch',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (ideationController.text.isEmpty ||
                ideationController.text == '_' ||
                executionController.text.isEmpty ||
                executionController.text == '_' ||
                pitchController.text.isEmpty ||
                pitchController.text=='_') {
              showErrorDialog(context, "Empty Fields are not allowed.");
              return;
            }

            int ideation = int.parse(ideationController.text);
            int execution = int.parse(executionController.text);
            int pitch = int.parse(pitchController.text);

            if (ideation > 10 || execution > 10 || pitch > 10) {
              showErrorDialog(context, "Invalid Score");
              return;
            }

            studentList[widget.idx].ideation = ideationController.text;
            studentList[widget.idx].execution = executionController.text;
            studentList[widget.idx].pitch = pitchController.text;
            widget.update();
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
