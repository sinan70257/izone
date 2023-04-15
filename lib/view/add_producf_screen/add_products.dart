import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/add_producf_screen/controllers/controllers.dart';
import 'package:izone/view/add_producf_screen/widgets/custom_app_bar.dart';
import 'package:izone/view/add_producf_screen/widgets/custom_field.dart';
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
                          children: [
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

  // Column dropDownList(
  //     {required String label,
  //     required double height,
  //     required double width,
  //     required bool GB}) {

  // }
}

class dropDownList extends StatefulWidget {
  dropDownList({
    super.key,
    required this.label,
    required this.height,
    required this.width,
    required this.GB,
  });
  final String label;
  final double height;
  final double width;

  final bool GB;

  @override
  State<dropDownList> createState() => _dropDownListState();
}

class _dropDownListState extends State<dropDownList> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.sora(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: widget.GB ? dropDown1() : dropDown2(),
          decoration: BoxDecoration(
              color: Kgrey, borderRadius: BorderRadius.circular(10)),
          height: widget.height,
          width: widget.width,
        ),
      ],
    );
  }

  DropdownButton<String> dropDown1() {
    // if (widget.category == true) {
    //   category = widget.pcategory;
    // }
    return DropdownButton(
      isExpanded: true,
      value: category,
      items: const [
        DropdownMenuItem(value: 'iPhone', child: Text('iPhone')),
        DropdownMenuItem(value: 'iPad', child: Text('iPad')),
        DropdownMenuItem(value: 'Macbook', child: Text('Macbook')),
        DropdownMenuItem(value: 'Apple watch', child: Text('Apple watch')),
      ],
      onChanged: (value) {
        setState(() {
          category = value!;
        });
      },
    );
  }

  DropdownButton<String> dropDown2() {
    // if (widget.category == false) {
    //   variant = widget.pvariant;
    // }
    return DropdownButton(
      isExpanded: true,
      value: variant,
      items: const [
        DropdownMenuItem(value: '64 GB', child: Text('64 GB')),
        DropdownMenuItem(value: '128 GB', child: Text('128 GB')),
        DropdownMenuItem(value: '256 GB', child: Text('256 GB')),
        DropdownMenuItem(value: '512 GB', child: Text('512 GB')),
      ],
      onChanged: (value) {
        setState(() {
          variant = value!;
        });
      },
    );
  }
}
