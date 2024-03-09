import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/student.dart';
import '../../widget/custom_card.dart';
import '../../widget/custom_checkbox.dart';
import '../../widget/error_dialog.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  List<int> assignedStudentIndex = [];

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    for (int i = 0; i < studentList.length; i++) {
      if (studentList[i].isSelected) {
        assignedStudentIndex.add(i);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Project Evaluation Dashboard',
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.purple.withOpacity(0.3)
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            constraints: BoxConstraints(
              // minHeight: 600,
              maxWidth: min(MediaQuery.of(context).size.width, 500),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'Assigned Students',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Divider(),
                    assignedStudentIndex.isEmpty
                        ? const Text(
                            'No Assigned Students',
                            style: TextStyle(color: Colors.white),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: assignedStudentIndex.length,
                              itemBuilder: (context, index) {
                                return customCard(
                                    studentList[assignedStudentIndex[index]]);
                              },
                            ),
                          ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    width: 175,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        customDialogBox(context, refresh, assignedStudentIndex);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.add, size: 20),
                          Text('Assign Student'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

void customDialogBox(
    BuildContext context, Function refresh, List<int> assignedStudentIndex) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Students'),
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
        content: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10),
          width: min(MediaQuery.of(context).size.width, 400),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: studentList.length,
            itemBuilder: (context, index) {
              return CustomCheckboxListTile(
                index: index,
                assignedList: assignedStudentIndex,
              );
            },
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (assignedStudentIndex.length < 3) {
                showErrorDialog(
                    context, "You have to select at least 3 students");
                return;
              }
              for (int i = 0; i < studentList.length; i++) {
                studentList[i].isSelected = false;
              }
              for (int i = 0; i < assignedStudentIndex.length; i++) {
                int idx = assignedStudentIndex[i];
                studentList[idx].isSelected = true;
              }
              refresh();
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}
