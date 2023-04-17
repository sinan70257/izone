import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';
import 'package:izone/view/edit_screen/edit_products.dart';

class floatingButton extends StatefulWidget {
  const floatingButton({super.key, this.data});
  final data;

  @override
  State<floatingButton> createState() => _floatingButtonState();
}

class _floatingButtonState extends State<floatingButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: sHeight! / 20,
        width: sWidth! / 1.1,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: customElevatedBotton(
              label: "Edit",
            )),
      ),
    );
  }

  Widget customElevatedBotton({required String label}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => editProduct(product: widget.data),
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
  }
}
