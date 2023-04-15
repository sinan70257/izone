import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/model/product.dart';

import 'package:izone/view/add_producf_screen/controllers/controllers.dart';

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
                            for (var image in widget.product['images'])
                              imageCard(product: image),
                            // imageCard(),
                            // imageCard(),
                            imgCard(),
                            // imageCard(image),
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
                          height: sHeight! / 5,
                          width: sWidth! / 1.05,
                          label: "Description")
                    ],
                  ),
                ),
              ),
              floatingButton(widget.product)
            ],
          ),
        ));
  }

  Align floatingButton(final product) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: sHeight! / 20,
        width: sWidth! / 1.1,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: customElevatedBotton(
              product: product,
              label: "Save",
            )),
      ),
    );
  }

  Column customField2(
      {required String label,
      required double height,
      required double width,
      required bool num,
      required TextEditingController controller,
      required bool max}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              color: Kgrey, borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
          child: customField(num, max, controller),
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
            "Edit Product",
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

  Widget customField(bool num, bool max, TextEditingController controller) {
    return TextFormField(
      onChanged: (value) {},
      minLines: 1,
      controller: controller,
      maxLines: max ? 6 : 1,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Kgrey,
        border: InputBorder.none,
        hintStyle: GoogleFonts.inter(
            textStyle: const TextStyle(color: Color.fromARGB(255, 80, 80, 80))),
      ),
    );
  }

  // ---------------------------------Custom Button --------------------------------
  Widget customElevatedBotton({required String label, final product}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: () {
          Product myproduct = Product(
              images: imgurl,
              quantity: qty_controller.text,
              name: name_controller.text,
              category: category!,
              price: price_controller.text,
              color: color_controller.text,
              variant: variant!,
              description: description_controller.text);
          myproduct.updateToFirestore(product);
          clear();
          Navigator.of(context).pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(" $label")],
        ));
  }
}

class imageCard extends StatefulWidget {
  const imageCard({super.key, this.product});
  final product;

  @override
  State<imageCard> createState() => _imageCardState();
}

class _imageCardState extends State<imageCard> {
  String? imagepath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          setState(() {
            imagepath = pickedFile.path;
          });
          updateImage(File(pickedFile.path), widget.product);
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: sWidth! / 2,
        width: sWidth! / 2,
        decoration: BoxDecoration(
            color: Kgrey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: imagepath == null
                    ? NetworkImage(widget.product) as ImageProvider
                    : FileImage(File(imagepath!)))),
      ),
    );
  }
}

class imgCard extends StatefulWidget {
  const imgCard({super.key});

  @override
  State<imgCard> createState() => _imgCardState();
}

class _imgCardState extends State<imgCard> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          setState(() {
            imagePath = pickedFile.path;
          });

          uploadImage(File(pickedFile.path), imgurl);
          // imgUrl.clear();
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: sWidth! / 2,
        width: sWidth! / 2,
        decoration: BoxDecoration(
            color: Kgrey,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: imagePath == null
                    ? NetworkImage(
                            "https://static.vecteezy.com/system/resources/thumbnails/007/746/401/small/add-photo-button-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg")
                        as ImageProvider
                    : FileImage(File(imagePath!)),
                fit: BoxFit.contain)),
      ),
    );
  }
}

class dropDownList extends StatefulWidget {
  dropDownList({
    super.key,
    required this.label,
    required this.height,
    required this.width,
    required this.GB,
    this.pcategory,
    this.pvariant,
    required this.category,
  });
  final String label;
  final double height;
  final double width;
  final bool category;

  final bool GB;
  String? pcategory;
  String? pvariant;

  @override
  State<dropDownList> createState() => _dropDownListState();
}

class _dropDownListState extends State<dropDownList> {
  @override
  void initState() {
    if (widget.category == true) {
      category = widget.pcategory!;
    } else {
      variant = widget.pvariant!;
    }
    super.initState();
  }

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
