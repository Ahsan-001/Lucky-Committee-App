import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class MainCard extends StatelessWidget {
  final String? title;
  final String? rs;

  final VoidCallback? ontap;
  MainCard({this.title, this.rs, this.ontap, super.key});

  final List<String> imgList = [
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
  ];
  final List<String> text = ["car", "car", "car", "car", "car", "car"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 265,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: kMainColor,
                    borderRadius: BorderRadius.circular(15),
                    color: kWhiteColor,

                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3.0,
                          spreadRadius: 0.9,
                          color: kBlackColor.withOpacity(0.2))
                    ],
                    // gradient: const LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [kMainColor, kMainColor2]),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 75,
                      ),

                      // SizedBox(
                      //   height: 110,
                      //   width: double.infinity,
                      //   child: CarouselSlider(
                      //     items: imgList
                      //         .map((item) => Center(
                      //               child: Image.asset(
                      //                 item,
                      //                 // height: 20,
                      //                 fit: BoxFit.cover,
                      //                 width: double.infinity,
                      //               ),
                      //             ))
                      //         .toList(),
                      //     options: CarouselOptions(
                      //       autoPlay: true,
                      //       aspectRatio: 2.0,
                      //       enlargeCenterPage: true,
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // CarouselWithDotsPage(imgList: imgList),
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Image.asset(
                                  "assets/images/car.png",
                                  // height: 100,
                                  width: 180,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                const Text('Car'),
                              ],
                            );
                          },
                        ),
                      ),
                      // ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 5,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Image.asset(
                      //         "assets/images/car.png",
                      //       );
                      //     }),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //       height: 80,
                      //       width: 80,
                      //       decoration: BoxDecoration(
                      //         color: kWhiteColor,
                      //         borderRadius: BorderRadius.circular(40),
                      //         // border: Border.all(color: kPrimaryColor),
                      //         boxShadow: [
                      //           BoxShadow(
                      //               blurRadius: 3.0,
                      //               spreadRadius: 0.9,
                      //               color: kBlackColor.withOpacity(0.1))
                      //         ],
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(5.0),
                      //         child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "POINTS",
                      //               style: h11HeadingBlackSimple.copyWith(
                      //                   color: kDarkLightColor),
                      //             ),
                      //             const Text(
                      //               "0 pts",
                      //               style: h16HeadingBlackBold,
                      //             ),
                      //             Positioned(
                      //               bottom: 0,
                      //               child: Image.asset(
                      //                 "assets/images/star.png",
                      //                 height: 25,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 95,
                      //       width: 95,
                      //       decoration: BoxDecoration(
                      //           color: kWhiteColor,
                      //           borderRadius: BorderRadius.circular(50),
                      //           // border: Border.all(color: kPrimaryColor),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 blurRadius: 4.0,
                      //                 spreadRadius: 2.2,
                      //                 color: kBlackColor.withOpacity(0.1)),
                      //           ]),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(5.0),
                      //         child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "PRIZE",
                      //               style: h14HeadingBlackSimple.copyWith(
                      //                   color: kDarkLightColor),
                      //             ),
                      //             const Text(
                      //               "Rs. 1",
                      //               style: h20HeadingBlackBold,
                      //             ),
                      //             Positioned(
                      //               bottom: 0,
                      //               child: Image.asset(
                      //                 "assets/icons/applogo1.png",
                      //                 height: 44,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 80,
                      //       width: 80,
                      //       decoration: BoxDecoration(
                      //           color: kWhiteColor,
                      //           borderRadius: BorderRadius.circular(40),
                      //           // border: Border.all(color: kPrimaryColor),
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 blurRadius: 3.0,
                      //                 spreadRadius: 0.9,
                      //                 color: kBlackColor.withOpacity(0.1))
                      //           ]),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(5.0),
                      //         child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               "TIME",
                      //               style: h11HeadingBlackSimple.copyWith(
                      //                   color: kDarkLightColor),
                      //             ),
                      //             const Text(
                      //               "00:23:00",
                      //               style: h16HeadingBlackBold,
                      //             ),
                      //             Positioned(
                      //               bottom: 0,
                      //               child: Image.asset(
                      //                 "assets/images/timer.png",
                      //                 height: 25,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: ontap,
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'VIEW',
                              style: h16HeadingBlackBold.copyWith(
                                  color: kWhiteColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  // color: kMainColor2,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [kBrownColor, kMainColor2]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   "assets/images/medal.png",
                            //   height: 45,
                            // ),
                            Text(
                              title!,
                              style: h18HeadingWhiteBold,
                            ),
                            // Image.asset(
                            //   "assets/images/medal.png",
                            //   height: 45,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/icons/applogo1.png",
                              height: 30,
                            ),
                            Container(height: 20, width: 2, color: kWhiteColor),
                            Text(
                              rs!,
                              style: h16HeadingWhiteBold.copyWith(
                                  color: Colors.white70),
                            ),
                            Container(height: 20, width: 2, color: kWhiteColor),
                            Text(
                              "January",
                              style: h13HeadingWhiteBold.copyWith(
                                  color: Colors.white70),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
