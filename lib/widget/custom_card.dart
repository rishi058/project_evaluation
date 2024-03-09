import 'package:flutter/material.dart';

import '../models/student.dart';


Widget customCard(Student temp){
  return Container(
    margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Row(
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
            Row(
              children: [
                const Text('Email : ', style: TextStyle(fontWeight: FontWeight.w500)),
                Text(temp.emailId, overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

