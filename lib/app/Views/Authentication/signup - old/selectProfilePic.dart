import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/login/login.dart';
import 'package:lucky_committee/app/Views/Authentication/signup%20-%20old/enterPw.dart';

class SelectProfilePic extends StatelessWidget {
  SelectProfilePic({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final isObsecure = true.obs;
  final isLoading = false.obs;

  late File image;
  final imageIsNull = true.obs;

  final isUploading = false.obs;
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
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        iconTheme: const IconThemeData(color: kBlackColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
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
                        color: kMainColor,
                      ),
                      color: kDarkColor,
                    ),
                    height: 35,
                    width: 35,
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          await chooseImage();
                          // if (imageIsNull.value ==
                          //     false) {
                          //   isUploading.value = true;
                          //   String url = await Storage()
                          //       .imageUploadToStorage(
                          //           image);
                          //   await Database()
                          //       .updateProfilePic(url);
                          //   isUploading.value = false;
                          // }
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
                      EnterPasswordView());
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
                          'Save & Next',
                          style: h16HeadingWhiteBold,
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(
              () => InkWell(
                onTap: () {
                  Get.to(
                      duration: const Duration(milliseconds: 400),
                      transition: Transition.rightToLeft,
                      EnterPasswordView());
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: kMainColor),
                      color: kWhiteColor),
                  child: isLoading.value
                      ? const CircularProgressIndicator(
                          color: kMainColor,
                        )
                      : const Text(
                          'Skip',
                          style: h16HeadingBlackBold,
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
