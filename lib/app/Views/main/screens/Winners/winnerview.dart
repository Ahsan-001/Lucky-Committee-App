import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Widgets/mywinningsCard.dart';
import 'package:lucky_committee/app/Widgets/totalWinnersCard.dart';

import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        body: ListView(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(
                    flip: true,
                  ),
                  child: Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [kBrownColor, kMainColor2],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Winnings Prizes",
                        style: h25HeadingWhiteBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Winnings",
                        style: h16HeadingBlackBold,
                      ),
                      Text(
                        "04",
                        style: h16HeadingBlackBold.copyWith(
                            color: kDarkLightColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const WinningProductCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/win.png",
                    title: "You a Bed",
                    subtitle: "Rs.300",
                    totalparticpants: '05',
                    productimg: "assets/images/bed.png",
                  ),
                  const WinningProductCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/win.png",
                    title: "You a Football",
                    subtitle: "Rs.300",
                    totalparticpants: '05',
                    productimg: "assets/images/football.png",
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Winners",
                        style: h16HeadingBlackBold,
                      ),
                      Text(
                        "10",
                        style: h16HeadingBlackBold.copyWith(
                            color: kDarkLightColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  const TotalWinnersCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/user.png",
                    title: "Idrees Khan",
                    subtitle: "Rs.300",
                    totalparticpants: '05',
                    productimg: "assets/images/bed.png",
                  ),
                  const TotalWinnersCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/user.png",
                    title: "Mr Ahsan",
                    subtitle: "Rs.200",
                    totalparticpants: '08',
                    productimg: "assets/images/sofa.png",
                  ),
                  const TotalWinnersCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/user.png",
                    title: "Mr Zain",
                    subtitle: "Rs.500",
                    totalparticpants: '06',
                    productimg: "assets/images/chair.png",
                  ),
                  const TotalWinnersCard(
                    announceDate: '19-12-2022',
                    profilepic: "assets/icons/user.png",
                    title: "Mr Muneeb",
                    subtitle: "Rs.100",
                    totalparticpants: '04',
                    productimg: "assets/images/football.png",
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ));
  }
}
