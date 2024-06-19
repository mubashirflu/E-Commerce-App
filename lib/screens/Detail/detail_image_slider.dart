import 'package:flutter/material.dart';

class Detail_Image_Slider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  const Detail_Image_Slider(
      {super.key, required this.image, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(tag: image, child: Image.asset(image));
        },
      ),
    );
  }
}
