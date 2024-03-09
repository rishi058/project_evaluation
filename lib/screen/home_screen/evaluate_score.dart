import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scaler_assignment/models/student.dart';
import 'package:scaler_assignment/widget/error_dialog.dart';
import '../../widget/edit_dialog.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({super.key});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {

  List<int> assignedStudentIndex = [];

  void refresh() {
    setState(() {});
  }

  void updateList(){
    assignedStudentIndex.clear();
    for (int i = 0; i < studentList.length; i++) {
      if (studentList[i].isSelected) {
        assignedStudentIndex.add(i);
      }
    }
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: const Center(child: Text('Evaluate Score', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),))),
            Container(
              constraints: BoxConstraints(
                maxWidth: min(MediaQuery.of(context).size.width, 800),
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width>900 ? 2 : 1,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                  ),
                  itemCount: assignedStudentIndex.length,
        
                  itemBuilder: (BuildContext context, int index){
                    return customCard(context, assignedStudentIndex[index], refresh);
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(

                onPressed: (){
                  bool ok = true;

                  for(int i=0; i<assignedStudentIndex.length; i++){
                    int idx = assignedStudentIndex[i];
                    if(studentList[idx].pitch=='_' || studentList[idx].execution=='_' || studentList[idx].ideation=='_'){
                        ok = false;
                    }
                  }

                  if(ok==false){
                    showErrorDialog(context, "Evaluate Score of all assigned students before submitting");
                    return;
                  }


                    for(int i=0; i<assignedStudentIndex.length; i++){
                        int idx = assignedStudentIndex[i];
                        if(studentList[idx].pitch=='_' || studentList[idx].execution=='_' || studentList[idx].ideation=='_'){

                        }
                        studentList[idx].isLocked = true;
                    }
                    updateList();
                },
                child: const Text('Final Submit', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      )
    );
  }
}

Widget customCard(BuildContext context, int idx, Function refresh){
  Student temp = studentList[idx];
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.withOpacity(0.3),
          Colors.purple.withOpacity(0.3)
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey.withOpacity(0.5),
                    child: const Icon(Icons.person),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Name : ', style: TextStyle(fontWeight: FontWeight.w500)),
                        Text(temp.name, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Roll No. : ', style: TextStyle(fontWeight: FontWeight.w500)),
                        Text(temp.rollNumber.toString(), overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Text('Ideation : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.5),),
                Text('${temp.ideation} / 10', style: const TextStyle(fontSize: 22.5),),
              ],
            ),
            const SizedBox(height: 25),

            Row(
              children: [
                const Text('Execution : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.5),),
                Text('${temp.execution} / 10', style: const TextStyle(fontSize: 22.5)),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Text('Pitch : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.5),),
                Text('${temp.pitch} / 10', style: const TextStyle(fontSize: 22.5)),
              ],
            )

          ],
        ),
        temp.isLocked ? const SizedBox() : ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogBox(idx: idx, update: refresh);
                },
              );
            },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit, size: 20),
              SizedBox(width: 15),
              Text('Edit Score'),
            ],
          ),
        )
      ],
    ),
  );
}




