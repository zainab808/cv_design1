import 'package:cv_design/view/cv_design.dart';
import 'package:cv_design/view/cv_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Sora"),
    debugShowCheckedModeBanner: false,
  
      home:CvScreen()
    );
  }
}
