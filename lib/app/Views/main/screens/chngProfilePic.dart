import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';

import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

class ChangeProfilePic extends StatelessWidget {
  ChangeProfilePic({super.key});
  File? image;
  final imageIsNull = true.obs;
  final isUploading = false.obs;
  final isLoading = false.obs;

  chooseImage() async {
    final imgPicker = ImagePicker();
    try {
      PickedFile? pickedFile = await imgPicker.getImage(
          source: ImageSource.gallery, imageQuality: 20);
      // image = File(pickedFile!.path);
      imageIsNull.value = false;
    } catch (e) {
      imageIsNull.value = true;
      Get.snackbar('Error', 'Select an Image to Upload');
    }
  }

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
        // title: const Text("Change Profile Picture"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: const Text(
                          "Change Profile Picture",
                          style: h25HeadingWhiteBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            "SELECT YOUR PROFILE PICTURE",
            style: h16HeadingBlackBold,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                  child: Container(
                    height: 110.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                        color: kDarkColor,
                        borderRadius: BorderRadius.circular(60)),
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SvgPicture.asset(
                        "assets/svgs/user.svg",
                        width: 122,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: kBrownColor,
                      ),
                      color: kDarkColor,
                    ),
                    height: 35,
                    width: 35,
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          await chooseImage();
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => InkWell(
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
                          'Save',
                          style: h16HeadingWhiteBold,
                        ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
