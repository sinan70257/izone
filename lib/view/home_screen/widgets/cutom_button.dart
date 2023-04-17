import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/model/product.dart';
import 'package:izone/view/add_producf_screen/add_products.dart';

class floatingButton extends StatelessWidget {
  const floatingButton({super.key});

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
              ctx: context,
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
          clear();
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
}
