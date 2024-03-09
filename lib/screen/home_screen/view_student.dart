import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/student.dart';

class FilterStudent extends StatefulWidget {
  const FilterStudent({super.key});

  @override
  State<FilterStudent> createState() => _FilterStudentState();
}

class _FilterStudentState extends State<FilterStudent> {
  String _selectedOption = 'All Students';

  List<Student> displayList = [], assignedList = [], notAssignedList = [];

  @override
  void initState() {
    displayList = studentList;
    for(int i=0; i<studentList.length; i++){
      if(studentList[i].isSelected){
        assignedList.add(studentList[i]);
      }
      else{
        notAssignedList.add(studentList[i]);
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
                  child: const Center(
                      child: Text(
                    'View Students',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Filter by : ', style: TextStyle(fontWeight: FontWeight.w600),),
                      DropdownButton<String>(
                        value: _selectedOption,
                        onChanged: (newValue) {
                          _selectedOption = newValue!;
                          if(_selectedOption=='All Students'){
                            displayList = studentList;
                          }
                          else if(_selectedOption=='Assigned Students'){
                            displayList = assignedList;
                          }
                          else{
                            displayList = notAssignedList;
                          }
                          setState(() {});
                        },
                        items: <String>['All Students', 'Assigned Students', 'Not Assigned Students']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: min(MediaQuery.of(context).size.width, 800),
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width>900 ? 2 : 1,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: displayList.length,

                    itemBuilder: (BuildContext context, int index){
                      return customDisplayCard(displayList[index]);
                    }
                ),
              )
            ],
          ),
        ));
  }
}


Widget customDisplayCard(Student temp){
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
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Ideation : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                Text('${temp.ideation}/10', style: const TextStyle(fontSize: 22.5),),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                const Text('Execution : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                Text('${temp.execution}/10', style: const TextStyle(fontSize: 22.5)),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text('Pitch : ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                Text('${temp.pitch}/10', style: const TextStyle(fontSize: 22.5)),
              ],
            )

          ],
        ),
      ],
    ),
  );
}