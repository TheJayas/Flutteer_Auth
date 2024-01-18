// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_element

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_input_field/main.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  var eml = TextEditingController();
  forgetPassFunc(String email) {
    if (email == "") {
      CustomAlertBox(
          context, "Please provide required email to reset password!");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      CustomAlertBox(
          context, "Reset password by following link sent through email");
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(title: "Login Page")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(243, 232, 238, 1),
                boxShadow: const [BoxShadow(blurStyle: BlurStyle.solid)]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: eml,
                    decoration: InputDecoration(
                        // suffixText: "UserName",
                        hintText: "Email",
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.email_rounded,
                            color: const Color.fromARGB(255, 235, 129, 164),
                          ),
                          onPressed: () {},
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 5, 97, 203)),
                            borderRadius: BorderRadius.circular(10)),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                    onPressed: () {
                      String email = eml.text.toString();
                      forgetPassFunc(email);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  static CustomAlertBox(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
          );
        });
  }
}
