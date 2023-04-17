import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';
import 'package:izone/view/edit_screen/widgets/custom_appbar.dart';
import 'package:izone/view/edit_screen/widgets/custom_drop_downlist.dart';
import 'package:izone/view/edit_screen/widgets/custom_edit_button.dart';
import 'package:izone/view/edit_screen/widgets/custom_field.dart';
import 'package:izone/view/edit_screen/widgets/image_cards.dart';

class editProduct extends StatefulWidget {
  const editProduct({super.key, this.product});
  final product;

  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  String? imagepath;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.product["images"].length; i++) {
      imgurl.add(widget.product["images"][i]);
    }
    log(imgurl.toString());
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppbar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      space10(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var image in widget.product['images'])
                              imageCard(product: image),
                            const imgCard(),
                          ],
                        ),
                      ),
                      customField2(
                        controller: name_controller =
                            TextEditingController(text: widget.product["name"]),
                        max: false,
                        num: false,
                        label: "Name",
                        height: sHeight! / 15,
                        width: sWidth! / 1.05,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            dropDownList(
                                category: true,
                                pcategory: widget.product["category"],
                                GB: true,
                                label: "Category",
                                height: sHeight! / 15,
                                width: sWidth! / 1.9),
                            const Spacer(),
                            customField2(
                                controller: qty_controller =
                                    TextEditingController(
                                        text: widget.product["quantity"]),
                                max: false,
                                num: true,
                                label: "Quantity",
                                height: sHeight! / 15,
                                width: sWidth! / 3.1),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          dropDownList(
                            category: false,
                            pvariant: widget.product["variant"],
                            label: "Size",
                            height: sHeight! / 15,
                            width: sWidth! / 3.1,
                            GB: false,
                          ),
                          const Spacer(),
                          customField2(
                            controller: color_controller =
                                TextEditingController(
                                    text: widget.product["color"]),
                            max: false,
                            label: "Color",
                            height: sHeight! / 15,
                            width: sWidth! / 1.9,
                            num: false,
                          )
                        ],
                      ),
                      customField2(
                        controller: price_controller = TextEditingController(
                            text: widget.product["price"].toString()),
                        max: false,
                        label: "Price",
                        height: sHeight! / 15,
                        width: sWidth! / 1.05,
                        num: true,
                      ),
                      customField2(
                          controller: description_controller =
                              TextEditingController(
                                  text: widget.product["description"]),
                          max: true,
                          num: false,
                          label: "Description"),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
              floatingButton(product: widget.product)
            ],
          ),
        ));
  }
}
