import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class TotalWinnersCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String totalparticpants;
  final String announceDate;
  final String productimg;
  final String profilepic;

  const TotalWinnersCard({
    Key? key,
    required this.title,
    required this.announceDate,
    required this.subtitle,
    required this.totalparticpants,
    required this.productimg,
    required this.profilepic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          profilepic,
          color: kMainColor2,
        ),
        tileColor: kWhiteColor,
        title: Text(
          title,
          style: h16HeadingBlackBold,
        ),
        subtitle: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  "Winning Amount: ",
                  style: h12HeadingBlackBold.copyWith(color: kDarkLightColor),
                ),
                Text(
                  subtitle,
                  style: h12HeadingBlackSimple.copyWith(color: kDarkLightColor),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  "Total Participants: ",
                  style: h12HeadingBlackBold.copyWith(color: kDarkLightColor),
                ),
                Text(
                  totalparticpants,
                  style: h12HeadingBlackSimple.copyWith(color: kDarkLightColor),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  announceDate,
                  style: h12HeadingBlackSimple.copyWith(color: kDarkLightColor),
                ),
              ],
            ),
          ],
        ),
        trailing: Image.asset(productimg),
      ),
    );
  }
}
