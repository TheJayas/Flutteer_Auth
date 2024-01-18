// // ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_input_field/otp_screen.dart';

// class PhoneAuthen extends StatefulWidget {
//   const PhoneAuthen({super.key});

//   @override
//   State<PhoneAuthen> createState() => _PhoneAuthState();
// }

// class _PhoneAuthState extends State<PhoneAuthen> {
//   var UserName = TextEditingController();
//   var phoneNum = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login Via Phone Number"),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: const Color.fromRGBO(243, 232, 238, 1),
//                 boxShadow: const [BoxShadow(blurStyle: BlurStyle.solid)]),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 300,
//                   child: TextField(
//                     controller: UserName,
//                     keyboardType: TextInputType.name,
//                     decoration: InputDecoration(
//                         hintText: "User Name",
//                         prefixIcon: IconButton(
//                           icon: Icon(
//                             Icons.phone_android_rounded,
//                             color: const Color.fromARGB(255, 235, 129, 164),
//                           ),
//                           onPressed: () {},
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.cyan),
//                             borderRadius: BorderRadius.circular(10)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 5, 97, 203)),
//                             borderRadius: BorderRadius.circular(10)),
//                         disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.blue),
//                             borderRadius: BorderRadius.circular(10)),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: 300,
//                   child: TextField(
//                     controller: phoneNum,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         hintText: "Phone Number",
//                         prefixIcon: IconButton(
//                           icon: Icon(
//                             Icons.phone_android_rounded,
//                             color: const Color.fromARGB(255, 235, 129, 164),
//                           ),
//                           onPressed: () {},
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.cyan),
//                             borderRadius: BorderRadius.circular(10)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Color.fromARGB(255, 5, 97, 203)),
//                             borderRadius: BorderRadius.circular(10)),
//                         disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.blue),
//                             borderRadius: BorderRadius.circular(10)),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: 180,
//                   child: ElevatedButton(
//                     child: Text(
//                       "Sent OTP",
//                       style: TextStyle(fontSize: 16, color: Colors.blue),
//                     ),
//                     onPressed: () async {
//                       String phoneNumber = phoneNum.text.toString();
//                       String uName = UserName.text.toString();
//                       phoneNumber = "+91$phoneNumber";
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                           verificationCompleted:
//                               (PhoneAuthCredential credential) {},
//                           verificationFailed: (FirebaseAuthException ex) {},
//                           codeSent: (String verification, int? resendToken) {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => OtpScreen(
//                                           VerificationId: verification,
//                                           UserName: uName,
//                                         )));
//                           },
//                           codeAutoRetrievalTimeout: (String verificationId) =>
//                               {},
//                           phoneNumber: phoneNumber);
//                     },
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
