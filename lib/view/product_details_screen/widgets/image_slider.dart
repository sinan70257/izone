import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';

class imageSlider extends StatefulWidget {
  const imageSlider({super.key, this.data});
  final data;

  @override
  State<imageSlider> createState() => _imageSliderState();
}

class _imageSliderState extends State<imageSlider> {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: CarouselSlider.builder(
        itemCount: widget.data["images"].length,
        itemBuilder: (context, index, realIndex) {
          return imageCard(widget.data["images"][index]);
        },

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
}
