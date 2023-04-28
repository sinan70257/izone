import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';

class fimageCard extends StatefulWidget {
  const fimageCard({super.key, this.product});
  final product;

  @override
  State<fimageCard> createState() => _imageCardState();
}

class _imageCardState extends State<fimageCard> {
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
          updateFimage(File(pickedFile.path), widget.product);
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

class fimgCard extends StatefulWidget {
  const fimgCard({
    super.key,
  });

  @override
  State<fimgCard> createState() => _imgCardState();
}

class _imgCardState extends State<fimgCard> {
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

          uploadFimage(File(pickedFile.path), fimg);

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
