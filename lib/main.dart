import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_chops/screens/mainScreens/home.dart';
import 'package:green_chops/screens/slide_pages/load.dart';
import 'package:green_chops/widgets/pageview.dart';
import 'firebase_options.dart';

final theme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 24, 102, 24)));
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: theme,
      home: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingScreen();
              }
              if (snapshot.hasData || snapshot.data != null) {
                return Home();
              } else {
                return PageViews();
              }
            }),
      ),
    );
  }
}

// Future<bool> checkifFirst(String userId) async {
//   //first we need to get data from firestore
//   // a query
//   final snapshot =
//       await FirebaseFirestore.instance.collection("user").doc(userId).get();
//   //we then check if there's any document inside this collection
//   if (snapshot.exists) {
//     //if the document exists we check the first time field
//     final firstTime = snapshot["firstTime"] as bool?;
//     return firstTime ?? true;
//   } else {
//     //if it doesn't exist we assume its the firstime
//     return false;
//   }
// }
