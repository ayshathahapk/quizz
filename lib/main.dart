import 'package:flutter/material.dart';
import 'feature/authentication/homescreen.dart';
import 'feature/authentication/signout.dart';
import 'feature/quizzsection/quizpage.dart';

void main() {
  runApp(const MyApp());
}
//
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
//
// // ...
//
// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  AuthScreen(),
      home:  AuthScreen(),
    );
  }
}

