import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class HomeCard extends StatelessWidget {
  final String? title;
  final VoidCallback? ontap;
  const HomeCard({
    Key? key,
    this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: kBrownColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title!,
              style: h18HeadingWhiteBold,
            ),
          ),
        ),
      ),
    );
  }
}
