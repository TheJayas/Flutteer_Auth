// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace, prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names, use_build_context_synchronously
//USES INPUT
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';
import 'forget_pass.dart';
import 'final_page.dart';
import 'sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaEnterpriseProvider('recaptcha-v3-site-key')
      // webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
            headlineMedium: TextStyle(fontFamily: 'Schyler'),
          )),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var boolVal;
  @override
  void initState() {
    super.initState();
    boolVal = true;
  }

  void func1() {
    setState(() {
      boolVal = !boolVal;
    });
  }

  var textFieldValueUserName = TextEditingController();
  var textFieldValueEmail = TextEditingController();
  var textFieldValuePassword = TextEditingController();
  loginF(String uName, String email, String passW) async {
    if (passW == "" || email == "") {
      CustomAlertBox(context, "Please provide required credentials!");
    } else {
      var pref = await SharedPreferences.getInstance();
      pref.setString("User_Name", uName);
      pref.setString("Email_Id", email);
      UserCredential? userCred;
      try {
        userCred = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: passW);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FinalPage(
                      UserName: uName,
                      emailId: email,
                    )));
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
        title: Text(widget.title),
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
                      hintText: "UserName",
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.person,
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
                        icon: Icon(
                          Icons.email_rounded,
                          color: const Color.fromARGB(255, 235, 129, 164),
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
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
              Container(
                height: 10,
              ),
              Container(
                width: 300,
                child: TextField(
                  obscureText: boolVal,
                  obscuringCharacter: '*',
                  controller:
                      textFieldValuePassword, //to store the value filled in Text Field
                  // enabled: false, //disable the textfield
                  decoration: InputDecoration(
                      // suffixText: "Password",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          boolVal ? Icons.visibility_off : Icons.visibility,
                          color: Colors.blueGrey,
                        ),
                        onPressed: func1,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
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
              Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(43, 111, 194, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(43, 111, 194, 1))),
                    onPressed: () {
                      String uName = textFieldValueUserName.text.toString();
                      String eml = textFieldValueEmail.text.toString();
                      String passWord = textFieldValuePassword.text.toString();
                      loginF(uName, eml, passWord);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.rubikMaze(
                          color: Color.fromRGBO(63, 206, 164, 1), fontSize: 30),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have and account? "),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text(
                        "Signup",
                        style:
                            TextStyle(color: Color.fromRGBO(43, 111, 194, 1)),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Text("Forget Password!"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgetPass()));
                },
              )
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
