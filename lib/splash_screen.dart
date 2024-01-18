// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_input_field/final_page.dart';
import 'package:flutter_application_input_field/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final user = FirebaseAuth.instance.currentUser;
      var pref = await SharedPreferences.getInstance();
      String? UserName = pref.getString("User_Name");
      String? emlId = pref.getString("Email_Id");
      if (user != null && UserName != null && emlId != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FinalPage(
                      UserName: UserName,
                      emailId: emlId,
                    )));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MyHomePage(title: "Login Page")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(193, 154, 183, 1),
                boxShadow: [BoxShadow(blurStyle: BlurStyle.solid)]),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Authenticating ",
                  style: GoogleFonts.rubikBeastly(fontSize: 20),
                ),
                LoadingAnimationWidget.twistingDots(
                  leftDotColor: const Color(0xFF1A1A3F),
                  rightDotColor: Color.fromARGB(255, 12, 110, 42),
                  size: 50,
                )
              ],
            ))));
  }
}
