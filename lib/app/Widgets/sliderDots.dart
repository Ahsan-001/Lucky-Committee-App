import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';

class CarouselWithDotsPage extends StatefulWidget {
  List<String> imgList;

  CarouselWithDotsPage({super.key, required this.imgList});

  @override
  State<CarouselWithDotsPage> createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  final int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.imgList.map((url) {
        int index = widget.imgList.indexOf(url);
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index ? kMainColor2 : kDarkLightColor,
          ),
        );
      }).toList(),
    );
  }
}
