import 'dart:async';

import 'package:ecommerce/Login/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, LoginScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset("assets/images/splash_screen.png",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
    );
  }
}
