import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/controller/controllers.dart';

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
