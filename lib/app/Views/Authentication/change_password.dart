import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';

import '../main/screens/Home/democard.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  var isLoading = false.obs;
  final TextEditingController password = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newRepeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperOne(
                  flip: true,
                ),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [kBrownColor, kMainColor2],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Change Password",
                      textAlign: TextAlign.center,
                      style: h25HeadingWhiteBold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/fPassword.png',
                      width: 150,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Change Password?",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "You can change password here",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kDarkLightColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: password,
                        cursorColor: kDarkColor,
                        decoration: const InputDecoration(
                          fillColor: kDarkLightColor,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.password,
                            color: kBrownColor,
                          ),
                          hintText: 'Old Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kDarkLightColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: newPassword,
                        cursorColor: kDarkColor,
                        decoration: const InputDecoration(
                          fillColor: kDarkLightColor,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.password,
                            color: kBrownColor,
                          ),
                          hintText: 'New Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kDarkLightColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: newRepeatPassword,
                        cursorColor: kDarkColor,
                        decoration: const InputDecoration(
                          fillColor: kDarkLightColor,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.password,
                            color: kBrownColor,
                          ),
                          hintText: 'Re-enter New Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.rightToLeft,
                            BottomNavigation());
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
                        child: isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Reset Password',
                                style: h16HeadingWhiteBold,
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
