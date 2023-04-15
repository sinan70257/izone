import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';

class orderDetail extends StatefulWidget {
  orderDetail({super.key, required this.title});
  final String title;

  @override
  State<orderDetail> createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
  String? _selectedItem;
  final List<String> imagesList = [
    'https://ivenus.in/wp-content/uploads/2022/09/iphone-14-pro-finish-unselect-gallery-2-202209.png',
    'https://ivenus.in/wp-content/uploads/2023/03/iPhone-14-Y_1.png',
    'https://ivenus.in/wp-content/uploads/2020/11/71TPda7cwUL-347x347.png',
    'https://ivenus.in/wp-content/uploads/2022/10/r1604_Cellular_11-in_4th-Gen_SG_PDP_Image_Avail_Position-2__en-IN.png',
  ];

  @override
  Widget build(BuildContext context) {
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomSheet: Container(
        height: sHeight! / 8.6,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "    Total :",
                  style: GoogleFonts.sora(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                Text(
                  "₹ 276990     ",
                  style: GoogleFonts.sora(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Kblue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    Order status",
                    style: GoogleFonts.sora(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  dropDownList(height: sHeight! / 28, width: sWidth! / 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: customAppbar(context, widget.title),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              space20(),
              customField2(
                  label: "Name",
                  height: sHeight! / 14,
                  width: sWidth! / 1.1,
                  num: false,
                  max: true,
                  content: "Inshad K"),
              customField2(
                  label: "Address",
                  height: sHeight! / 6,
                  width: sWidth! / 1.1,
                  num: false,
                  max: true,
                  content:
                      "Thannikode House , Mathur Post, Kuzhalmannam Palakkad Pin : 675423 kerala, india"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sWidth! / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Products",
                      style: GoogleFonts.sora(
                          textStyle: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: sHeight! / 9.5,
                        decoration: BoxDecoration(
                          color: Kgrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(),
                            Container(
                              margin: EdgeInsets.only(left: sWidth! / 38),
                              height: sWidth! / 5.5,
                              width: sWidth! / 5.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.network(imagesList[index]),
                            ),
                            SizedBox(
                              width: sWidth! / 35,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                space20(),
                                Text(
                                  "iPhone 14 Pro - Deep Purple",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                ),
                                Text(
                                  "256 GB",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500)),
                                ),
                                space10(),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "₹ 98,999",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16)),
                                    ),
                                    SizedBox(
                                      width: sWidth! / 3.5,
                                    ),
                                    Text(
                                      "Qty : 5",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13)),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              customField2(
                  label: "Payment method",
                  height: sHeight! / 14,
                  width: sWidth! / 1.1,
                  num: false,
                  max: false,
                  content: "Credid/Debit/ATM Card"),
              SizedBox(
                height: sHeight! / 8.6,
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar customAppbar(BuildContext context, String title) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(top: sWidth! / 10, left: sWidth! / 15),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      title: Padding(
        padding: EdgeInsets.only(top: sHeight! / 13),
        child: SizedBox(
          height: sWidth! / 7,
          child: Text(
            title,
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

  Column customField2(
      {required String label,
      required double height,
      required double width,
      required bool num,
      required bool max,
      required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Kgrey, borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
          child: customField(num, max, content),
        ),
      ],
    );
  }

  Widget customField(bool num, bool max, String content) {
    return TextFormField(
      minLines: 1,
      initialValue: content,
      readOnly: true,
      maxLines: max ? 6 : 1,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Kgrey,
        border: InputBorder.none,
        hintStyle: GoogleFonts.inter(
            textStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80))),
      ),
    );
  }

  Widget dropDownList({
    required double height,
    required double width,
  }) {
    return Container(
      margin: EdgeInsets.only(right: sWidth! / 18),
      padding: EdgeInsets.only(left: 15),
      child: dropDown1(),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      height: height,
      width: width,
    );
  }

  DropdownButton<String> dropDown1() {
    return DropdownButton(
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      isExpanded: true,
      value: _selectedItem,
      items: const [
        DropdownMenuItem(value: 'Ordered', child: Text('Ordered')),
        DropdownMenuItem(value: 'Shipped', child: Text('Shipped')),
        DropdownMenuItem(value: 'Delivered', child: Text('Delivered')),
        DropdownMenuItem(value: 'Cancelled', child: Text('Cancelled')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedItem = value;
        });
      },
    );
  }
}
