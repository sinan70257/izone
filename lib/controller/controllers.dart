import 'dart:developer';
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
List<String> fimg = [];
String? category;
String? variant;
int? total;

Future<String> uploadImage(File imageFile, List<String> imgUrl) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  imgUrl.add(downloadURL);
  log(imgUrl.toString());
  return downloadURL;
}

Future<String> uploadFimage(File imageFile, List<String> imgUrl) async {
  final uniqueImgName = DateTime.now();
  final refRoot = FirebaseStorage.instance.ref();
  final storageRef = refRoot.child('images');

  final imgToUpload = storageRef.child(uniqueImgName.toString());

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  fimg.add(downloadURL);
  log(fimg.length.toString());
  return downloadURL;
}

Future<String> updateImage(File imageFile, String imgUrl) async {
  final uniqueImgName = DateTime.now();
  final Reference imgToUpload = FirebaseStorage.instance.refFromURL(imgUrl);

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  log(imgUrl.toString());

  return downloadURL;
}

Future<String> updateFimage(File imageFile, String imgUrl) async {
  final uniqueImgName = DateTime.now();
  final Reference imgToUpload = FirebaseStorage.instance.refFromURL(imgUrl);

  await imgToUpload.putFile(imageFile);
  final downloadURL = await imgToUpload.getDownloadURL();
  print('Image uploaded at $downloadURL');
  log(imgUrl.toString());

  return downloadURL;
}
