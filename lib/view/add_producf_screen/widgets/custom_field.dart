import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';

Column customField2(
    {required String label,
    required double height,
    required double width,
    required bool num,
    TextEditingController? controller,
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
        child: customField(num, max, controller!),
      ),
    ],
  );
}

Widget customField(bool num, bool max, TextEditingController controller) {
  return TextFormField(
    onChanged: (value) {},
    controller: controller,
    minLines: 1,
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
