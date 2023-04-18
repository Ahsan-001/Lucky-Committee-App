import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.lable,
    this.controller,
    required this.leadingIcon,
    this.obsecure,
    this.trailing,
  }) : super(key: key);

  final TextEditingController? controller;
  final IconData leadingIcon;
  final Widget? trailing;
  final String lable;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: double.infinity,
      // decoration: BoxDecoration(
      //     // color: kFadedColor,
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: kMainColor)),
      child: TextField(
        // obscureText: obsecure,
        controller: controller,
        cursorColor: kDarkColor,
        style: const TextStyle(color: kBlackColor),
        decoration: InputDecoration(
            fillColor: kDarkLightColor,
            // border: InputBorder.none,
            // labelStyle: TextStyle(color: kDarkColor),
            icon: Icon(
              leadingIcon,
              color: kBrownColor,
            ),
            hintText: lable,
            hintStyle: const TextStyle(color: kDarkColor),
            suffixIcon: trailing),
      ),
    );
  }
}
