import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/edit_screen/edit_products.dart';

class productDetails extends StatefulWidget {
  const productDetails({super.key, this.data});
  final data;

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
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
                      imageSlider(),
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
              floatingButton()
            ],
          ),
        ));
  }

  Widget imageSlider() {
    return Container(
      height: 320,
      child: CarouselSlider.builder(
        itemCount: widget.data["images"].length,
        itemBuilder: (context, index, realIndex) {
          return imageCard(widget.data["images"][index]);
        },

        // items: widget.data["images"],

        carouselController: _controller,
        options: CarouselOptions(
          pageSnapping: true,
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),

        // add the PageIndicator as the pagination parameter
      ),
    );
  }

  Container imageCard(String image) {
    return Container(
      margin: EdgeInsets.all(5),
      height: sWidth! / 2,
      width: sWidth! / 2,
      decoration:
          BoxDecoration(color: Kgrey, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Image.network(
        image,
        fit: BoxFit.cover,
      )),
    );
  }

  Align floatingButton() {
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

  Column dropDownList(
      {required String label,
      required double height,
      required double width,
      required bool GB}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: GB ? dropDown1() : dropDown2(),
          decoration: BoxDecoration(
              color: Kgrey, borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
        ),
      ],
    );
  }

  DropdownButton<String> dropDown1() {
    return DropdownButton(
      isExpanded: true,
      // value: _selectedItem,
      items: const [
        DropdownMenuItem(value: 'iPhone', child: Text('iPhone')),
        DropdownMenuItem(value: 'iPad', child: Text('iPad')),
        DropdownMenuItem(value: 'Macbook', child: Text('Macbook')),
        DropdownMenuItem(value: 'Apple watch', child: Text('Apple watch')),
      ],
      onChanged: (value) {
        setState(() {
          // _selectedItem = value;
        });
      },
    );
  }

  DropdownButton<String> dropDown2() {
    return DropdownButton(
      isExpanded: true,
      // value: _selectedItem2,
      items: const [
        DropdownMenuItem(value: '64 GB', child: Text('64 GB')),
        DropdownMenuItem(value: '128 GB', child: Text('128 GB')),
        DropdownMenuItem(value: '256 GB', child: Text('256 GB')),
        DropdownMenuItem(value: '512 GB', child: Text('512 GB')),
      ],
      onChanged: (value) {
        setState(() {
          // _selectedItem2 = value;
        });
      },
    );
  }

  Column customField2(
      {required String label,
      double? height,
      double? width,
      required bool num,
      required bool max,
      required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            " $label",
            style: GoogleFonts.sora(
                textStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
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
            Navigator.of(context).pop();
          },
        ),
      ),

      title: Padding(
        padding: EdgeInsets.only(top: sHeight! / 13),
        child: SizedBox(
          height: sWidth! / 7,
          child: Text(
            "Product details",
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

  Widget customField(bool num, bool max, String content) {
    return TextFormField(
      minLines: 1,
      initialValue: content,
      readOnly: true,
      maxLines: max ? 50 : 1,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Kgrey,
        border: InputBorder.none,
        hintStyle: GoogleFonts.inter(textStyle: TextStyle(color: Kgrey)),
      ),
    );
  }

  // ---------------------------------Custom Button --------------------------------
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
