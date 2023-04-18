import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Controllers/login_controller.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/login/enterOTP.dart';
import 'package:lucky_committee/app/Views/Authentication/signup%20-%20old/enterPw.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  final isObsecure = true.obs;

  final isLoading = false.obs;
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _loginWithPhoneNumber() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await loginWithPhoneNumber(_phoneController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavigation(
            apiToken: response.token,
          ),
        ),
      );
      Get.snackbar('Login', 'Successfully', backgroundColor: kSuccessColor);
    } catch (e) {
      print('failed');
      print(_phoneController.text);
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final _formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: kBrownColor,
        //   automaticallyImplyLeading: false,
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipPath(
                clipper: WaveClipperOne(flip: true),
                child: Container(
                  height: 160,
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

              Image.asset(
                "assets/images/login-.gif",
                height: 140,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKeyLogin,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          color: kBlackColor.withOpacity(0.10),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        if (!validatePhone(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                      controller: _phoneController,
                      style: h14HeadingBlackSimple,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.phone,
                            color: kBrownColor,
                          ),
                        ),
                        hintText: 'Phone Number',
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: kMainColor,
                  ),
                  Text(
                    " Enter your registered phone number here",
                    style: h12HeadingBlackSimple,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    if (_formKeyLogin.currentState!.validate()) {
                      _isLoading ? null : _loginWithPhoneNumber();
                    }
                  },
                  // Get.to(
                  //     duration: const Duration(milliseconds: 400),
                  //     transition: Transition.rightToLeft,
                  //     EnterOTPView());

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
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: kBrownColor,
                          )
                        : Text(
                            'LOGIN',
                            style: h16HeadingBlackBold.copyWith(
                                color: kWhiteColor),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool validatePhone(String phone) {
  // The regular expression for a valid phone number
  RegExp phoneExp = new RegExp(r'^\d{10}$');

  // Check if the phone number matches the regular expression
  if (phoneExp.hasMatch(phone)) {
    return true;
  }
  return false;
}
