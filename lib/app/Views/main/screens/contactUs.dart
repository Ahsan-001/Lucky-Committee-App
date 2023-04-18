import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

import 'Home/democard.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        // title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: WaveClipperOne(
                flip: true,
              ),
              child: Container(
                width: double.infinity,
                height: 140,
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
                    "Contact Us",
                    textAlign: TextAlign.center,
                    style: h25HeadingWhiteBold,
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/contact.gif",
              height: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            const AuthTextfield(
              obsecure: false,
              type: TextInputType.text,
              titlename: "Enter name",
              leadingIcon: Icons.person,
            ),
            // const AuthTextfield(
            //     obsecure: false,
            //     type: TextInputType.emailAddress,
            //     titlename: "Enter email",
            //     leadingIcon: Icons.email),
            const AuthTextfield(
                obsecure: false,
                type: TextInputType.phone,
                titlename: "Enter mobile number",
                leadingIcon: Icons.phone),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      color: kBlackColor.withOpacity(0.10),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter Message", border: InputBorder.none),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    // Get.to(
                    //     duration: const Duration(milliseconds: 400),
                    //     transition: Transition.rightToLeft,
                    //     BottomNavigation());
                  },
                  borderRadius: BorderRadius.circular(40.0),
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
                            color: kWhiteColor,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                ' Send Message ',
                                style: h16HeadingWhiteBold,
                              ),
                              Icon(
                                Icons.send,
                                color: kWhiteColor,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
