import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/SignupSetup/signupOTP.dart';
import 'package:lucky_committee/app/Views/Authentication/SignupSetup/signupview.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

class EnterNumView extends StatefulWidget {
  EnterNumView({super.key});

  @override
  State<EnterNumView> createState() => _EnterNumViewState();
}

class _EnterNumViewState extends State<EnterNumView> {
  final _registerFormKey = GlobalKey<FormState>();
  String? _phoneno;
  bool validatePhoneNumber(String phoneNumber) {
    // regular expression to match a 10-digit phone number
    final RegExp regex = RegExp(r'^\d{10}$');

    // check if the phone number matches the regex
    if (!regex.hasMatch(phoneNumber)) {
      return false;
    }

    return true;
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
        title: const Text("Register Number"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              height: 140,
              width: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [kBrownColor, kMainColor2],
                ),
              ),
              child: Image.asset(
                "assets/icons/applogo2.png",
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const [
                Text(
                  "PHONE NUMBER",
                  style: h16HeadingBlackBold,
                ),
              ],
            ),
          ),
          Form(
            key: _registerFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountryPickerDropdown(
                    isExpanded: false,
                    initialValue: 'pk',
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (Country country) {
                      print("${country.name}");
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Phone Number",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!validatePhoneNumber(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phoneno = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                if (_registerFormKey.currentState!.validate()) {
                  _registerFormKey.currentState!.save();
                  print('Valid phone number: $_phoneno');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupSetup(phoneNumber: _phoneno!),
                    ),
                  );

                  // do something with the valid phone number
                }
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
                  'Next',
                  style: h16HeadingWhiteBold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Row(
      children: [
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    );
