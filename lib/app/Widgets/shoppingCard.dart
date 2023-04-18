import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Models/cardList.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

class ShoppingCardDisplay extends StatelessWidget {
  final String name;
  final String images;
  final String prize;
  final String desp;
  ShoppingCardDisplay(
      {required this.desp,
      required this.images,
      required this.name,
      required this.prize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 140,

      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.09),
                    offset: Offset(2, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(54.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 5, right: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   wi
                        // ),
                        Container(
                          height: 15,
                          width: 30,
                          decoration: BoxDecoration(
                            color: kDarkLightColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "New",
                              // textAlign: TextAlign.center,
                              style: h11HeadingWhiteSimple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 05, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            // height: 40,
                            // width: 70,
                            child: Text(
                              desp,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                letterSpacing: 0.2,
                                color: kDarkLightColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Rs.\n$prize',
                            style: h16HeadingBlackBold.copyWith(
                                color: kBrownColor)),
                        MaterialButton(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {},
                          height: 30,
                          minWidth: 30,
                          splashColor: kLightColor,
                          color: kMainColor2,
                          child: const Text("Book Now",
                              style: h11HeadingWhiteBold),
                        ),
                        // SizedBox(
                        //   width: 30,
                        // ),
                        // Image.asset(
                        //   'assets/images/cart.png',
                        //   height: 30,
                        //   width: 30,
                        //   fit: BoxFit.contain,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Container(
          //     width: 84,
          //     height: 84,
          //     decoration: BoxDecoration(
          //       color: Colors.transparent,
          //       shape: BoxShape.circle,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0,
            left: 8,
            child: SizedBox(
              width: 90,
              height: 90,
              child: Image.network(images),
            ),
          )
        ],
      ),
    );
  }
}
