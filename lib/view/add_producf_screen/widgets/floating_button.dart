import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/model/product.dart';
import 'package:izone/view/add_producf_screen/controllers/controllers.dart';
import 'package:izone/view/home_screen/home_screen.dart';

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
            label: "Save",
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
        if (imgurl.isEmpty ||
            qty_controller.text.isEmpty ||
            name_controller.text.isEmpty ||
            category == null ||
            variant == null ||
            price_controller.text.isEmpty ||
            color_controller.text.isEmpty ||
            description_controller.text.isEmpty) {
          ScaffoldMessenger.of(ctx!).showSnackBar(SnackBar(
            content: Text(
              "Enter all data !",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
            animation: AlwaysStoppedAnimation(100),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ));
        } else {
          ScaffoldMessenger.of(ctx!).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Product added successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.done,
                  color: Colors.white,
                )
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
            animation: const AlwaysStoppedAnimation(100),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ));
          Product myproduct = Product(
              images: imgurl,
              quantity: qty_controller.text,
              name: name_controller.text,
              category: category!,
              price: price_controller.text,
              color: color_controller.text,
              variant: variant!,
              description: description_controller.text);
          myproduct.addToFirestore();
          clear();
          Navigator.push(
              ctx,
              MaterialPageRoute(
                builder: (context) => homeScreen(),
              ));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(" $label")],
      ));
}
