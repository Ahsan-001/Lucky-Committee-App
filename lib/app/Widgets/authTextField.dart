import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield(
      {Key? key,
      // required this.title,
      required this.titlename,
      required this.leadingIcon,
      this.trailing,
      this.obsecure,
      this.type})
      : super(key: key);
  final String? titlename;
  final TextInputType? type;
  final IconData? leadingIcon;
  final bool? obsecure;
  final Widget? trailing;

  // final TextEditingController title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              spreadRadius: 1.0,
              color: kBlackColor.withOpacity(0.10),
            ),
          ],
        ),
        child: TextField(
          // controller: title,
          obscureText: obsecure!,
          style: h14HeadingBlackSimple,
          keyboardType: type,
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Icon(
                leadingIcon!,
                color: kBrownColor,
              ),
            ),
            hintText: titlename!,
            hintStyle: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            suffixIcon: trailing,
          ),
        ),
      ),
    );
  }
}
