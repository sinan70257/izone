import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

TextEditingController name_controller = TextEditingController();
TextEditingController size_controller = TextEditingController();
TextEditingController description_controller = TextEditingController();
TextEditingController color_controller = TextEditingController();
TextEditingController qty_controller = TextEditingController();
TextEditingController price_controller = TextEditingController();
TextEditingController category_controller = TextEditingController();

List<String> imgurl = [];
String? category;
String? variant;

Future<String> uploadImage(File imageFile, List<String> imgUrl) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  imgUrl.add(downloadURL);
  return downloadURL;
}

Future<String> updateImage(File imageFile, String imgUrl) async {
  final uniqueImgName = DateTime.now();
  final Reference imgToUpload = FirebaseStorage.instance.refFromURL(imgUrl);

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');

  return downloadURL;
}
