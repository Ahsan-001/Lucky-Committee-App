import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

class AddNewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    File? imageFile;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [kBrownColor, kMainColor2],
            ),
          ),
        ),
        elevation: 0,
        title: const Text('Add NewsFeed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    color: kDarkColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(
                          imageFile.toString(),
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 115,
                  top: MediaQuery.of(context).size.height / 5.3,
                  child: InkWell(
                    onTap: () async {
                      print('0=----');
                      PickedFile? pickedFile = await ImagePicker().getImage(
                        source: ImageSource.gallery,
                        maxWidth: 1800,
                        maxHeight: 1800,
                      );
                      if (pickedFile != null) {
                        File imageFile = File(pickedFile.path);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kTextfieldColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Upload Image',
                        style:
                            h15HeadingWhiteSimple.copyWith(color: kBlackColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: const [
                      Text(
                        "Title",
                        style: h16HeadingBlackBold,
                      ),
                    ],
                  ),
                ),
                const AuthTextfield(
                  leadingIcon: Icons.title,
                  titlename: "Enter your Title here",
                  obsecure: false,
                  type: TextInputType.text,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    children: const [
                      Text(
                        "Description",
                        style: h16HeadingBlackBold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: kBlackColor.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: const TextField(
                      maxLines: 10,
                      // controller: title,
                      style: h14HeadingBlackSimple,
                      decoration: InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.description,
                            color: kBrownColor,
                          ),
                        ),
                        hintText: 'About NewsFeed',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                          duration: const Duration(milliseconds: 600),
                          transition: Transition.zoom,
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
                          colors: [kOrangeColor, kYellowColor],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Add',
                        style: h16HeadingBlackBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
