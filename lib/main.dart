import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './constants.dart';
import './views/screens/auth/login_screen.dart';
import './views/screens/auth/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tiktok clone',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: MaterialApp(
          home: Scaffold(
        body: SignupScreen(),
      )),
    );
  }
}
