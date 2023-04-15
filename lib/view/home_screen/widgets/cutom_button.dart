import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/model/product.dart';
import 'package:izone/view/add_producf_screen/add_products.dart';
import 'package:izone/view/add_producf_screen/controllers/controllers.dart';

Align floatingButton(BuildContext ctx) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: customElevatedBotton(
            ctx: ctx,
            label: "Add new product",
          )),
    ),
  );
}

Widget customElevatedBotton({required String label, BuildContext? ctx}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: () {
        Navigator.push(
            ctx!,
            MaterialPageRoute(
              builder: (context) => addProduct(),
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(" $label")],
      ));
}
