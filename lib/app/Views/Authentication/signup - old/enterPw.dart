import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Controllers/checkController.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/login/login.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

class EnterPasswordView extends StatelessWidget {
  EnterPasswordView({Key? key}) : super(key: key);
  final CheckController1 ctrl1 = Get.put(CheckController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kBlackColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AuthTextfield(
            leadingIcon: Icons.password,
            titlename: "Password",
          ),
          const AuthTextfield(
            leadingIcon: Icons.password_outlined,
            titlename: "confirm password",
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: ctrl1.checkbool.value,
                  onChanged: (value) {
                    ctrl1.checkbool.value = !ctrl1.checkbool.value;
                  },
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Are you agree with ',
                        style: h14HeadingBlackSimple,
                      ),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: h14HeadingBlackBold.copyWith(color: kMainColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to desired screen
                          },
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: h14HeadingBlackSimple,
                      ),
                      TextSpan(
                        text: 'Privacy & Policy',
                        style: h14HeadingBlackBold.copyWith(color: kMainColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to desired screen
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                Get.to(
                    duration: const Duration(milliseconds: 400),
                    transition: Transition.downToUp,
                    LoginView());
              },
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: kMainColor),
                child: const Text(
                  'Continue',
                  style: h16HeadingWhiteBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
