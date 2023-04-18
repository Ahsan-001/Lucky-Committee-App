import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/change_password.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';

class EditProfile extends StatelessWidget {
  // final userController = Get.find<UserController>();
  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildMainInfo(context, widthC),
            const SizedBox(height: 10.0),
            _buildInfo(context, widthC),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Ink(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [kBrownColor, kMainColor2],
            ),
          ),
        ),
        Ink(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                      child: Container(
                        height: 110.0,
                        width: 110.0,
                        decoration: BoxDecoration(
                            color: kBlackColor,
                            borderRadius: BorderRadius.circular(60)),
                        padding: const EdgeInsets.all(2),
                        child: SvgPicture.asset(
                          'assets/svgs/user.svg',
                          width: 122,
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
                          color: kOrangeColor,
                        ),
                        height: 35,
                        width: 35,
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              // await chooseImage();
                              // if (imageIsNull.value == false) {
                              //   isUploading.value = true;
                              //   String url =
                              //       await Storage().imageUploadToStorage(image);
                              //   await Database().updateProfilePic(url);
                              //   isUploading.value = false;
                              // }
                            },
                            child: const Icon(
                              Icons.add,
                              color: kBrownColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMainInfo(BuildContext context, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          const Text(
            "Username",
            style: h22HeadingBlackBold,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, double width) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // const ListTile(
                    //   leading: Icon(Icons.email, color: kMainColor),
                    //   title: Text("E-Mail"),
                    //   subtitle: Text("email123@gmail.com"),
                    // ),
                    // const Divider(),
                    const ListTile(
                      leading: Icon(Icons.account_circle, color: kMainColor),
                      title: Text("Change Name"),
                      subtitle: Text("Edit the username"),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.to(ChangePassword());
                      },
                      leading: const Icon(Icons.lock, color: kBrownColor),
                      title: const Text("Change Password"),
                      subtitle: const Text("********"),
                    ),
                    // const ListTile(
                    //   leading: Icon(Icons.headphones, color: kMainColor),
                    //   title: Text("Customer Support"),
                    //   subtitle: Text("submit complain with screenshots"),
                    // ),
                    const Divider(),
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
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        width: 200,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
                          ),
                        ),
                        child: const Text(
                          'LOGOUT',
                          style: h16HeadingWhiteBold,
                        ),
                      ),
                    ),

                    // Divider(),
                    // ListTile(
                    //   contentPadding:
                    //       EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    //   leading: Icon(Icons.my_location, color: Colors.blue),
                    //   title: Text("Location"),
                    //   subtitle: Text("Canada"),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
