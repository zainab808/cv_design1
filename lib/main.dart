// import 'package:cv_design/view/cv_design.dart';
// import 'package:cv_design/view/cv_screen.dart';
// import 'package:cv_design/view/free_resume_templete.dart';
// import 'package:cv_design/view/portfolio_design.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: "Sora"),
//     debugShowCheckedModeBanner: false,
  
//       home:PortfolioDesign()
//     );
//   }
// }











import 'package:cv_design/view/cv_design.dart';
import 'package:cv_design/view/cv_screen.dart';
import 'package:cv_design/view/free_resume_templete.dart';
import 'package:cv_design/view/portfolio_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 👈 add this

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024), // 👈 apne design base screen ke hisaab se (web layout)
      minTextAdapt: true, // text adjust automatically
      splitScreenMode: true, // tablet/desktop ke liye helpful
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(fontFamily: "Sora"),
          debugShowCheckedModeBanner: false,
          home:  const PortfolioDesign(), // 👈 yahan se app start hogi,
        );
      },
     
    );
  }
}
