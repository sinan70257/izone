import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:izone/view/home_screen/home_screen.dart';
import 'package:izone/view/login_screen/login_screen.dart';
import 'package:izone/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isloggedIn1 = false;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/screen 1.jpg"), fit: BoxFit.cover),
      ),
    ));
  }

  void checkLoginStatus() async {
    log("called");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("awaited");
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      isloggedIn1 = isLoggedIn;
    });
    if (isLoggedIn == true) {
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homeScreen(),
      ));
    } else {
      await Future.delayed(const Duration(seconds: 0));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const loginScreen()));
    }
  }
}
