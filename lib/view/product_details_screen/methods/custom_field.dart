import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';

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
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
