import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class BlogsCard extends StatelessWidget {
  final Widget? img;
  final String? title;
  final String? subtitle;
  final String? time;
  final VoidCallback? ontap;

  const BlogsCard({
    Key? key,
    this.img,
    this.title,
    this.subtitle,
    this.time,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: ontap,
        tileColor: kWhiteColor,
        leading: img!,
        title: Text(
          title!,
          style: h14HeadingBlackBold,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle!,
                style: h12HeadingBlackBold.copyWith(color: kOrangeColor),
              ),
              Text(
                time!,
                style: h12HeadingBlackBold.copyWith(color: kDarkLightColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
