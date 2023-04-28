import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';
import 'package:izone/model/product.dart';
import 'package:izone/view/feature_imge_screen/methods/custom_appbar.dart';
import 'package:izone/view/feature_imge_screen/methods/image_card.dart';

class featureImage extends StatefulWidget {
  const featureImage({super.key});

  @override
  State<featureImage> createState() => _featureImageState();
}

class _featureImageState extends State<featureImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      bottomSheet: SizedBox(
          width: sWidth,
          child: ElevatedButton(
              onPressed: () {
                final ref = FirebaseFirestore.instance
                    .collection("feature")
                    .doc("images");
                f my = f(fimg: fimg);
                my.addToFirestoreFeature();
              },
              child: Text("Add"))),
      body: ListView(
        children: [
          for (var image in fimg) fimageCard(product: image),
          fimgCard1(),
        ],
      ),
    );
  }

  Widget fimgCard1() {
    String? imagePath;
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
                    : FileImage(File(imagePath)),
                fit: BoxFit.contain)),
      ),
    );
  }
}
