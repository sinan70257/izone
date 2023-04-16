import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/product_details_screen/methods/custom_field.dart';
import 'package:izone/view/product_details_screen/widgets/custom_appbar.dart';
import 'package:izone/view/product_details_screen/widgets/custom_buttom.dart';
import 'package:izone/view/product_details_screen/widgets/image_slider.dart';

class productDetails extends StatefulWidget {
  const productDetails({super.key, this.data});
  final data;

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  @override
  Widget build(BuildContext context) {
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
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      space10(),
                      imageSlider(data: widget.data),
                      customField2(
                          max: false,
                          num: false,
                          label: "Name",
                          height: sHeight! / 15,
                          width: sWidth! / 1.05,
                          content: widget.data["name"]),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customField2(
                                max: false,
                                num: false,
                                content: widget.data["category"],
                                label: "Category",
                                height: sHeight! / 15,
                                width: sWidth! / 1.9),
                            const Spacer(),
                            customField2(
                                content: widget.data["quantity"].toString(),
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
                          customField2(
                              content: widget.data["variant"],
                              label: "Size",
                              height: sHeight! / 15,
                              width: sWidth! / 3.1,
                              num: false,
                              max: false),
                          const Spacer(),
                          customField2(
                            content: widget.data["color"],
                            max: false,
                            label: "Color",
                            height: sHeight! / 15,
                            width: sWidth! / 1.9,
                            num: false,
                          )
                        ],
                      ),
                      customField2(
                        content: widget.data["price"].toString(),
                        max: false,
                        label: "Price",
                        height: sHeight! / 15,
                        width: sWidth! / 1.05,
                        num: true,
                      ),
                      customField2(
                          content: widget.data["description"],
                          max: true,
                          num: false,
                          label: "Description"),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
              floatingButton(data: widget.data)
            ],
          ),
        ));
  }
}
