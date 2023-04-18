import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/signup%20-%20old/enterPw.dart';
import 'package:lucky_committee/app/Views/Authentication/signup%20-%20old/selectProfilePic.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

class EnterCityView extends StatelessWidget {
  EnterCityView({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final isObsecure = true.obs;
  final isLoading = false.obs;

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
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const [
                Text(
                  "CITY",
                  style: h16HeadingBlackBold,
                ),
              ],
            ),
          ),
          const AuthTextfield(
            leadingIcon: Icons.location_city,
            titlename: "Enter your city",
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => InkWell(
                onTap: () {
                  Get.to(
                      duration: const Duration(milliseconds: 400),
                      transition: Transition.rightToLeft,
                      SelectProfilePic());
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: kMainColor),
                  child: isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Next',
                          style: h16HeadingWhiteBold,
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
