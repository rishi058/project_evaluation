import 'package:flutter/material.dart';
import '../models/student.dart';
import 'error_dialog.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final int index;
  final List<int> assignedList;

  const CustomCheckboxListTile({
    Key? key,
    required this.index,
    required this.assignedList,
  }) : super(key: key);

  @override
  CustomCheckboxListTileState createState() => CustomCheckboxListTileState();
}

class CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  late bool isChecked;
  late Student student;

  @override
  void initState() {
    student = studentList[widget.index];
    isChecked = student.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              if(value!){    // when checked
                if(widget.assignedList.length==4){
                    showErrorDialog(context, "You cannot select more than 4 students");
                }
                else{
                  setState(() {
                    widget.assignedList.add(widget.index);
                    isChecked = value;
                  });
                }
              }
              else{
                setState(() {
                  widget.assignedList.remove(widget.index);
                  isChecked = value;
                });
              }
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Name : ', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(student.name, overflow: TextOverflow.ellipsis),
                ],
              ),
              Row(
                children: [
                  const Text('Roll No. : ', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(student.rollNumber.toString(), overflow: TextOverflow.ellipsis),
                ],
              ),
              Row(
                children: [
                  const Text('Email : ', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(student.emailId, overflow: TextOverflow.ellipsis),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
