import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/login/login.dart';
import 'package:lucky_committee/app/Views/Authentication/SignupSetup/enterNum.dart';
import 'package:lucky_committee/app/Views/Authentication/SignupSetup/signupview.dart';

import '../../Widgets/curveWidget.dart';

class WelcomeView extends StatelessWidget {
  final VoidCallback? onTap;
  const WelcomeView({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            ShaderMask(
                child: Image(
                  image: AssetImage('assets/images/welcomebg.png'),
                ),
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [kBrownColor, kMainColor2],
                  ).createShader(bounds);
                }),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight,
            //         colors: [kBrownColor, kMainColor2],
            //       ),
            //       image: DecorationImage(
            //           image: AssetImage('assets/images/welcomebg.png'))),
            // ),
            // Image.asset(
            //   "assets/images/welcomebg.png",
            //   color: kBrownColor,
            // ),
            // ClipPath(
            //   clipper: WaveClipperOne(flip: true, reverse: true),
            //   child: Container(
            //     height: 400,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         colors: [kMainColor2, kBrownColor],
            //       ),
            //     ),
            //     // child: Center(
            //     //   child: Text(
            //     //     "WaveClipperTwo(flip: true,reverse: true)",
            //     //   ),
            //     // ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/applogo2.png",
                    height: 250,
                  ),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Horizon',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText(
                            'WELCOME',
                            textStyle: h25HeadingBlackBold.copyWith(
                                color: kAmberColor),
                          ),
                          RotateAnimatedText(
                            'TO',
                            textStyle: h25HeadingBlackBold.copyWith(
                                color: kMainColor2),
                          ),
                          RotateAnimatedText(
                            'PER PAY COMMITTEE',
                            textStyle: h25HeadingBlackBold.copyWith(
                                color: kWhiteColor),
                          ),
                        ],
                        onTap: onTap,
                        pause: const Duration(milliseconds: 200),
                        isRepeatingAnimation: true,
                        totalRepeatCount: 5,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // const Text(
                  //   "Welcome to Lucky Committee",
                  //   style: h28HeadingBlackBold,
                  // ),
                  GestureDetector(
                    onTap: () => Get.to(
                        duration: const Duration(milliseconds: 400),
                        transition: Transition.downToUp,
                        LoginView()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "SIGN IN",
                                    style: h13HeadingWhiteBold.copyWith(
                                        color: kWhiteColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Image.asset(
                                "assets/icons/login.png",
                                color: kBrownColor,
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => EnterNumView()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/signup.png",
                                color: kBrownColor,
                                height: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Don't have an Account ?",
                                style: h13HeadingWhiteBold.copyWith(
                                    color: kBrownColor),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    "SIGN UP",
                                    style: h13HeadingWhiteBold.copyWith(
                                        color: kWhiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
