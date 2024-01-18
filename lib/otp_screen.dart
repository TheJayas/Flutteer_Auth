// // ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable, non_constant_identifier_names, empty_catches, await_only_futures, avoid_print

// // import 'dart:math';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'final_page.dart';

// class OtpScreen extends StatefulWidget {
//   String VerificationId;
//   String UserName;
//   OtpScreen({super.key, required this.VerificationId, required this.UserName});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   var otpVal = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("OTP Screem"),
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
//                     controller: otpVal,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         hintText: "OTP",
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
//                       "Verify",
//                       style: TextStyle(fontSize: 16, color: Colors.blue),
//                     ),
//                     onPressed: () async {
//                       String otpValue = otpVal.text.toString();
//                       try {
//                         PhoneAuthCredential cred =
//                             await PhoneAuthProvider.credential(
//                                 verificationId: widget.VerificationId,
//                                 smsCode: otpValue);
//                         FirebaseAuth.instance
//                             .signInWithCredential(cred)
//                             .then((value) => Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => FinalPage(
//                                           UserName: widget.UserName,
//                                         ))));
//                       } catch (ex) {
//                         print(ex.toString());
//                       }
//                     },
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
