import 'package:custom_pin_entry_field/custom_pin_entry_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/SignupSetup/signupview.dart';
import 'package:lucky_committee/app/Views/Authentication/signup%20-%20old/enterName.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';

import '../../main/screens/Home/democard.dart';

class SignupOTPView extends StatelessWidget {
  const SignupOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        elevation: 0,
        title: const Text("Verify Phone Number"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/applogo2.png",
                      height: 100,
                    ),
                  ],
                ),
              ],
            ),

            // const SizedBox(
            //   height: 20,
            // ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Enter the verification code sent by SMS on ',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // code to open / launch terms of service link here
                        }),
                  TextSpan(
                    style: h16HeadingBlackBold,
                    children: [
                      TextSpan(
                        text: '+923104562923',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // code to open / launch privacy policy link here
                          },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomPinEntryField(
              fields: 4,
              textStyle: h14HeadingBlackSimple,
              keyboard: TextInputType.number,
              showFieldAsBox: true,
              onSubmit: (String pin) {
                showDialog(
                    useSafeArea: true,
                    // barrierColor: primaryColor,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(
                            child: Text("Pin",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))),
                        content: Text('Pin entered is $pin'),
                      );
                    }); //end showDialog()
              }, // enend onSubmit
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Did not receive OTP ?",
              style: h15HeadingBlackSimple,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/sms.png",
                      height: 40,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Get OTP on SMS",
                      style: h13HeadingBlackSimple.copyWith(
                          color: kDarkLightColor),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/whatsapp.png",
                      height: 40,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Get OTP on WhatsApp",
                      style: h13HeadingBlackSimple.copyWith(
                          color: kDarkLightColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  // Get.to(
                  //     duration: const Duration(milliseconds: 600),
                  //     transition: Transition.zoom,
                  //     SignupSetup());
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Verify',
                    style: h16HeadingWhiteBold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
