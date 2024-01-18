// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, empty_catches, avoid_print, unused_local_variable
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'show_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_input_field/main.dart';

class FinalPage extends StatefulWidget {
  final String UserName;
  final String emailId;
  const FinalPage({super.key, required this.UserName, required this.emailId});
  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  File? pickedImg;
  pickImage(ImageSource imgS) async {
    try {
      var photo = await ImagePicker().pickImage(source: imgS);
      if (photo == null) {
        print(12);
        return;
      }
      final tempImg = File(photo.path);
      setState(() {
        pickedImg = tempImg;
        print(122);
      });
    } catch (ex) {
      print(ex.toString());
      print(1222);
    }
  }

  showAlerBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick Image From"),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.image_sharp),
                title: Text("Gallary"),
              )
            ]),
          );
        });
  }

  uploadPhoto() async {
    if (pickedImg == null) {
      return;
    }

    UploadTask uploadTask = FirebaseStorage.instance
        .ref("ProfilePics")
        .child("${widget.emailId}.jpg")
        .putFile(pickedImg!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.emailId)
        .update({"ProfilePic": url});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Congratulations"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
          child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(243, 232, 238, 1),
                  boxShadow: const [BoxShadow(blurStyle: BlurStyle.solid)]),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: showAlerBox,
                    child: pickedImg != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(pickedImg!),
                          )
                        : CircleAvatar(
                            radius: 80,
                            child: Icon(
                              Icons.person,
                              size: 80,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        uploadPhoto();
                      },
                      child: Text("Upload Profile")),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Welcome ${widget.UserName},"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("You are successfully logged in."),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Go to login screen",
                        style: TextStyle(
                          color: Colors.cyan.shade400,
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage(
                                          title: "Login Screen")));
                            });
                          },
                          icon: const Icon(Icons.logout))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowUserData()));
                    },
                    child: Text(
                      "See User List..",
                      style: TextStyle(
                        color: Colors.cyan.shade400,
                      ),
                    ),
                  ),
                ],
              )))),
    );
  }
}
