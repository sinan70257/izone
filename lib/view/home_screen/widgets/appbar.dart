import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/login_screen/login_screen.dart';
import 'package:izone/view/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.only(top: sHeight! / 20, right: sWidth! / 12),
        child: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => loginScreen()),
                  (route) => false);
              logout();
            },
            icon: Icon(
              Icons.logout_rounded,
              color: Colors.white,
              size: sWidth! / 12,
            )),
      ),
    ],

    title: Padding(
      padding: EdgeInsets.only(top: sHeight! / 20),
      child: SizedBox(
          height: sWidth! / 7,
          child: Image.asset('lib/assets/iZone.png', fit: BoxFit.cover)),
    ),

    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: sHeight! / 8, // default is 56
    toolbarOpacity: 1,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
    ),
  );
}

void logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('isLoggedIn');

  isloggedIn1 = false;
}
