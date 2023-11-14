
import 'package:ecommerce/Home/HomeScreen.dart';
import 'package:ecommerce/Login/LoginScreen.dart';
import 'package:ecommerce/MyTheme.dart';
import 'package:ecommerce/SplashScreen.dart';
import 'package:ecommerce/register/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      builder: (context,child){return  MaterialApp(
    routes: {
    SplashScreen.routeName:(context)=>SplashScreen(),
     LoginScreen.routeName:(context)=>LoginScreen(),
      RegisterScreen.routeName:(context)=>RegisterScreen(),
      HomeScreen.routeName:(context)=>HomeScreen()
    },
    initialRoute: SplashScreen.routeName,
    debugShowCheckedModeBanner: false,
        theme: MyTheme.mainTheme,
        themeMode: ThemeMode.light,
    );}

    );
  }
}


