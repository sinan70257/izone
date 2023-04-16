import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/model/product.dart';

AppBar customAppbar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(top: sWidth! / 10, left: sWidth! / 15),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 30,
        ),
        onPressed: () {
          clear();
          Navigator.of(context).pop();
        },
      ),
    ),

    title: Padding(
      padding: EdgeInsets.only(top: sHeight! / 13),
      child: SizedBox(
        height: sWidth! / 7,
        child: Text(
          "Edit Product",
          style: GoogleFonts.sora(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
