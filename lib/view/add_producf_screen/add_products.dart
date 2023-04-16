import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';
import 'package:izone/view/add_producf_screen/widgets/custom_app_bar.dart';
import 'package:izone/view/add_producf_screen/widgets/custom_field.dart';
import 'package:izone/view/add_producf_screen/widgets/drop_downlist.dart';
import 'package:izone/view/add_producf_screen/widgets/image_card.dart';
import 'package:izone/view/add_producf_screen/widgets/floating_button.dart';

String dropdownValue = 'Dog';

class addProduct extends StatefulWidget {
  const addProduct({super.key});

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      space10(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            imgCard(),
                            imgCard(),
                            imgCard(),
                            imgCard(),
                          ],
                        ),
                      ),
                      customField2(
                        controller: name_controller,
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
                                GB: true,
                                label: "Category",
                                height: sHeight! / 15,
                                width: sWidth! / 1.9),
                            const Spacer(),
                            customField2(
                                controller: qty_controller,
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
                            label: "Size",
                            height: sHeight! / 15,
                            width: sWidth! / 3.1,
                            GB: false,
                          ),
                          const Spacer(),
                          customField2(
                            max: false,
                            controller: color_controller,
                            label: "Color",
                            height: sHeight! / 15,
                            width: sWidth! / 1.9,
                            num: false,
                          )
                        ],
                      ),
                      customField2(
                        max: false,
                        controller: price_controller,
                        label: "Price",
                        height: sHeight! / 15,
                        width: sWidth! / 1.05,
                        num: true,
                      ),
                      customField2(
                          max: true,
                          num: false,
                          controller: description_controller,
                          label: "Description"),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
              floatingButton(context)
            ],
          ),
        ));
  }
}
