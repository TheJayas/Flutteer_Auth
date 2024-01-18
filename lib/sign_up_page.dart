// import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, use_build_context_synchronously, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

// import 'alert_dialog.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var boolVal1;
  var boolVal2;
  @override
  void initState() {
    super.initState();
    boolVal1 = true;
    boolVal2 = true;
  }

  void func2() {
    setState(() {
      boolVal2 = !boolVal2;
    });
  }

  void func1() {
    setState(() {
      boolVal1 = !boolVal1;
    });
  }

  var textFieldValueUserName = TextEditingController();
  var textFieldValuePhoneNum = TextEditingController();
  var textFieldValueEmail = TextEditingController();
  var textFieldValuePassword = TextEditingController();
  var textFieldValueConPassword = TextEditingController();
  signUp(String uName, String email, String phoneNum, String passW,
      String conPass) async {
    if (phoneNum == "" ||
        uName == "" ||
        passW == "" ||
        email == "" ||
        conPass == "") {
      CustomAlertBox(context, "Please provide all required credentials!");
    } else if (passW != conPass) {
      CustomAlertBox(context, "Password and Confirm password must be same!");
    } else {
      // UserCredential? userCred;
      UserCredential? userCred;
      try {
        userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: passW);
        FirebaseFirestore.instance
            .collection("Users")
            .doc(email)
            .set({"UserName": uName, "Email": email, "PhoneNumber": phoneNum});
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const MyHomePage(title: "Login Page")));
      } on FirebaseAuthException catch (ex) {
        return CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SignUp Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  controller:
                      textFieldValueUserName, //to store the value filled in Text Field
                  // enabled: false, //disable the textfield
                  decoration: InputDecoration(
                      // suffixText: "UserName",
                      hintText: "User Name",
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.cyan,
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 5, 97, 203)),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller:
                      textFieldValueEmail, //to store the value filled in Text Field
                  // enabled: false, //disable the textfield
                  decoration: InputDecoration(
                      // suffixText: "UserName",
                      hintText: "Email",
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.email_rounded,
                          color: Color.fromARGB(255, 235, 129, 164),
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 5, 97, 203)),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  controller:
                      textFieldValuePhoneNum, //to store the value filled in Text Field
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      // suffixText: "UserName",
                      hintText: "Phone Number",
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.cyan,
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.cyan),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 5, 97, 203)),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  obscureText: boolVal1,
                  obscuringCharacter: '*',
                  controller:
                      textFieldValuePassword, //to store the value filled in Text Field
                  // enabled: false, //disable the textfield
                  decoration: InputDecoration(
                      // suffixText: "Password",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          boolVal1 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          func1();
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  obscureText: boolVal2,
                  obscuringCharacter: '*',
                  controller:
                      textFieldValueConPassword, //to store the value filled in Text Field
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          boolVal2 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                          func2();
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(43, 111, 194, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(43, 111, 194, 1))),
                    onPressed: () {
                      String userName = textFieldValueUserName.text.toString();
                      String phoneNum = textFieldValuePhoneNum.text.toString();
                      String eml = textFieldValueEmail.text.toString();
                      String passWord = textFieldValuePassword.text.toString();
                      String conpassWord =
                          textFieldValueConPassword.text.toString();
                      signUp(userName, eml, phoneNum, passWord, conpassWord);
                    },
                    child: Text(
                      'Signup',
                      style: GoogleFonts.rubikMaze(
                          color: const Color.fromRGBO(63, 206, 164, 1),
                          fontSize: 25),
                    ),
                  )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account, "),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: "Login Page"),
                            ));
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(color: Color.fromRGBO(43, 111, 194, 1)),
                      ))
                ],
              ),
            ]),
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
