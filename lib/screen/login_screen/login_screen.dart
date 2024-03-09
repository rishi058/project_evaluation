import 'dart:math';

import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
        child: SizedBox(
          height: MediaQuery.of(context).size.height/2.5,
          width: min(MediaQuery.of(context).size.width, 400),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text('Login', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),)),
                  const Divider(),
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: (){},
                      child: const Text('Submit')
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
