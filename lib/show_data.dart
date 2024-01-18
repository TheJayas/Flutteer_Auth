// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'firebase_options.dart';

class ShowUserData extends StatefulWidget {
  const ShowUserData({super.key});

  @override
  State<ShowUserData> createState() => _ShowUserDataState();
}

class _ShowUserDataState extends State<ShowUserData> {
  // File? download_img;
//   downImg(String emailId) as{
//     final data = await request.single;
// final file = File('$basePath/output_files/output.${intFixed(frame, 3)}.jpg');
// file.writeAsBytesSync(data);
//     // DownloadTask downloadTask=;
//     // DownloadTask downloadTask = FirebaseStorage.instance
//     //     .ref("ProfilePics")
//     //     .child("$emailId.jpg")
//     //     .writeToFile(download_img);
//     // File taskSnapshot = download_img!;
//     // return taskSnapshot;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Users List"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!.docs[index]["ProfilePic"])
                          // downImg(snapshot.data!.docs[index]["Email"]),
                          ),
                      title: Text(
                        "${snapshot.data!.docs[index]["UserName"]}",
                        style: GoogleFonts.getFont('Roboto Slab', fontSize: 20),
                      ),
                      subtitle: Text("${snapshot.data!.docs[index]["Email"]}"),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error while connecting to Firebase"),
              );
            } else {
              return Center(child: Text("No Data Available"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
