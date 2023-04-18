import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucky_committee/app/Controllers/checkController.dart';
import 'package:lucky_committee/app/Models/registermodel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/login/login.dart';
import 'package:http/http.dart' as http;
import 'package:lucky_committee/app/Views/bottomNavigation.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';
import 'package:lucky_committee/app/Widgets/authTextField.dart';

class SignupSetup extends StatefulWidget {
  const SignupSetup({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  _SignupSetup createState() => _SignupSetup();
}

class _SignupSetup extends State<SignupSetup> {
  final CheckController1 ctrl1 = Get.put(CheckController1());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  final serviceController = Get.find<SerivceTypeDropDownController>();

  final isObsecure = true.obs;
  final isLoading = false.obs;
  File? image;
  final imageIsNull = true.obs;

  final isUploading = false.obs;
  // chooseImage() async {
  //   final imgPicker = ImagePicker();
  //   try {
  //     PickedFile? pickedFile = await imgPicker.getImage(
  //         source: ImageSource.gallery, imageQuality: 20);
  //     // image = File(pickedFile!.path);
  //     imageIsNull.value = false;
  //   } catch (e) {
  //     imageIsNull.value = true;
  //     Get.snackbar('Error', 'Select an Image to Upload');
  //   }
  // }

  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 4; // upperBound MUST BE total number of icons minus 1.
  ///
  late String _phoneno;
  // _SignupState() {
  //   _phoneno = widget.phoneNumber;
  // }
  @override
  void initState() {
    _phoneno = widget.phoneNumber;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  // String _name = '';
  // String _email = '';
  // String _password = '';
  // String _confirmPassword = '';
  // String _phoneno = widget.phoneNumber;
  // int _state = 0;
  // String city = '';
  bool _isLoading = false;
  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://perpaycommittee.com/api/register');
    final response = await http.post(url, body: {
      'name': name.text,
      'email': email.text,
      'password': password.text,
      'confirm_password': confirmpassword.text,
      'phone': _phoneno,
      'state': state.text,
      'city': city.text,
    });

//
//     final request = http.MultipartRequest(
//         'POST', Uri.parse('https://perpaycommittee.com/api/register'))
//       // ..headers['Authorization'] = 'Bearer your_token_here'
//       ..files.add(await http.MultipartFile.fromPath(
//         'image',
//         '/image.jpg',
//         contentType: MediaType('image', 'jpg'),
//       ))
//       ..fields['name'] = _name
//       ..fields['email'] = _email
//       ..fields['phone'] = _phoneno
//       ..fields['password'] = _password
//       ..fields['confirm_password'] = _confirmPassword
//       ..fields['city'] = city
//       ..fields['state'] = _state.toString();

// // final response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
    }
    if (response.statusCode == 200) {
      final register = Register.fromJson(json.decode(response.body));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
      print(response.body);
    } else {
      print(response.body);
    }
  }

  File? _image;
  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  List<int> stateCodes = [1, 2, 3, 4, 5];
  List<String> stateNames = [
    'Punjab',
    'Sindh',
    'Balochistan',
    'Gilgit Baltistan',
    'Khyber Pakhtunkhwa'
  ];

  int? _selectedStateCode;
  String? _selectedStateName;

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('Create an Account'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        iconTheme: const IconThemeData(color: kWhiteColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  width: 50,
                ),
              ),
            ),
            Column(
              children: [
                IconStepper(
                  activeStepColor: kBrownColor,
                  enableNextPreviousButtons: false,
                  icons: const [
                    Icon(
                      Icons.badge,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.domain,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.location_city,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.lock,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.photo_library,
                      color: kWhiteColor,
                    ),
                  ],

                  // activeStep property set to activeStep variable defined above.
                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
                const SizedBox(height: 20),
                header(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nextButton(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: activeStep == 0 || activeStep == 4
            //       ? MainAxisAlignment.center
            //       : MainAxisAlignment.spaceBetween,
            //   children: [
            //     activeStep == 0
            //         ? Container()
            //         : activeStep == 4
            //             ? Container()
            //             : previousButton(),
            //     nextButton(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
                if (activeStep < upperBound) {
                  setState(() {
                    activeStep++;
                  });
                }
              }
           
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          // width: activeStep == 0 || activeStep == 4 ? 250 : 100,
          width: 250,
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
              : const Text(
                  'Next',
                  style: h16HeadingWhiteBold,
                ),
        ),
      ),
    );
  }

  // Widget previousButton() {
  //   return InkWell(
  //     onTap: () {
  //       if (activeStep > 0) {
  //         setState(() {
  //           activeStep--;
  //         });
  //       }
  //     },
  //     borderRadius: BorderRadius.circular(10.0),
  //     child: Container(
  //       width: 100,
  //       height: 50.0,
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(25.0), color: kMainColor),
  //       child: isLoading.value
  //           ? const CircularProgressIndicator(
  //               color: Colors.white,
  //             )
  //           : const Text(
  //               'Back',
  //               style: h16HeadingWhiteBold,
  //             ),
  //     ),
  //   );
  // }

  Widget header() {
    return Container(
      height: 250,
      width: 300,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kBrownColor, kMainColor2],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          body(),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  Widget body() {
    // final serviceController = Get.find<SerivceTypeDropDownController>();

    switch (activeStep) {
      case 0:
        return SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: const [
                    Text(
                      "FULL NAME",
                      style: h16HeadingWhiteBold,
                    ),
                  ],
                ),
              ),
              Padding(
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
                    controller: name,
                    style: h14HeadingBlackSimple,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.person,
                          color: kBrownColor,
                        ),
                      ),
                      hintText: 'Enter your full name',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        name.text = value!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: const [
                    Text(
                      "EMAIL",
                      style: h16HeadingWhiteBold,
                    ),
                  ],
                ),
              ),
              Padding(
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
                    controller: email,
                    style: h14HeadingBlackSimple,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.person,
                          color: kBrownColor,
                        ),
                      ),
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        email.text = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );

      case 1:
        return SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: const [
                    Text(
                      "STATE",
                      style: h16HeadingWhiteBold,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  padding: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhiteColor,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<int>(
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      items: stateCodes.map((int stateCode) {
                        return DropdownMenuItem<int>(
                          value: stateCode,
                          child: Text(stateNames[stateCode - 1]),
                        );
                      }).toList(),
                      onChanged: (stateCode) {
                        setState(() {
                          _selectedStateCode = stateCode;
                          _selectedStateName = stateNames[stateCode! - 1];
                          state.text = stateCode.toString();
                        });
                        print(stateCode);
                      },
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.place,
                          color: kBrownColor,
                        ),
                        hintText: 'Select State here',
                        hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a state';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),

             
            ],
          ),
        );
      case 2:
        return SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: const [
                    Text(
                      "CITY",
                      style: h16HeadingWhiteBold,
                    ),
                  ],
                ),
              ),
            
              Padding(
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
                    controller: city,
                    style: h14HeadingBlackSimple,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      icon: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.location_city,
                          color: kBrownColor,
                        ),
                      ),
                      hintText: 'Enter your city',
                      hintStyle: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        city.text = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        );

      case 3:
        return SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AuthTextfield(
              //   type: TextInputType.visiblePassword,
              //   leadingIcon: Icons.lock,
              //   titlename: "Password",
              //   obsecure: isObsecure.value,
              //   trailing: isObsecure.value
              //       ? IconButton(
              //           onPressed: () {
              //             isObsecure.value = false;
              //           },
              //           icon: const Icon(
              //             Icons.password,
              //             color: kBrownColor,
              //           ),
              //         )
              //       : IconButton(
              //           onPressed: () {
              //             isObsecure.value = true;
              //           },
              //           icon: const Icon(
              //             Icons.remove_red_eye,
              //             color: kBrownColor,
              //           ),
              //         ),
              // ),
              Padding(
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
                    controller: password,
                    style: h14HeadingBlackSimple,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: isObsecure.value
                          ? IconButton(
                              onPressed: () {
                                isObsecure.value = false;
                              },
                              icon: const Icon(
                                Icons.password,
                                color: kBrownColor,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                isObsecure.value = true;
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: kBrownColor,
                              ),
                            ),
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.lock,
                          color: kBrownColor,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    obscureText: isObsecure.value,
                    onSaved: (value) {
                      setState(() {
                        password.text = value!;
                      });
                    },
                  ),
                ),
              ),

              // AuthTextfield(
              //   obsecure: isObsecure.value,
              //   type: TextInputType.visiblePassword,
              //   leadingIcon: Icons.lock,
              //   titlename: "Confirm password",
              //   trailing: isObsecure.value
              //       ? IconButton(
              //           onPressed: () {
              //             isObsecure.value = false;
              //           },
              //           icon: const Icon(
              //             Icons.password,
              //             color: kBrownColor,
              //           ),
              //         )
              //       : IconButton(
              //           onPressed: () {
              //             isObsecure.value = true;
              //           },
              //           icon: const Icon(
              //             Icons.remove_red_eye,
              //             color: kBrownColor,
              //           ),
              //         ),
              // ),
              Padding(
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
                    controller: confirmpassword,
                    style: h14HeadingBlackSimple,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: isObsecure.value
                          ? IconButton(
                              onPressed: () {
                                isObsecure.value = false;
                              },
                              icon: const Icon(
                                Icons.password,
                                color: kBrownColor,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                isObsecure.value = true;
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: kBrownColor,
                              ),
                            ),
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          Icons.lock,
                          color: kBrownColor,
                        ),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm Password';
                      }
                      return null;
                    },
                    obscureText: isObsecure.value,
                    onSaved: (value) {
                      setState(() {
                        confirmpassword.text = value!;
                      });
                    },
                  ),
                ),
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
                            style: h14HeadingWhiteSimple,
                          ),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: h14HeadingBlackBold.copyWith(
                                color: kWhiteColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),
                          const TextSpan(
                            text: ' and ',
                            style: h14HeadingWhiteSimple,
                          ),
                          TextSpan(
                            text: 'Privacy & Policy',
                            style: h14HeadingWhiteBold,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      case 4:
        return SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SELECT YOUR PROFILE PICTURE",
                style: h16HeadingWhiteBold,
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
                          child: _image == null
                              ? SvgPicture.asset(
                                  "assets/svgs/user.svg",
                                  width: 122,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
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
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Container(
                                      child: Wrap(
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Photo Library'),
                                            onTap: () {
                                              _getImage(ImageSource.gallery);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text('Camera'),
                                            onTap: () {
                                              _getImage(ImageSource.camera);
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                              // await chooseImage();
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
            ],
          ),
        );

      default:
        return Container();
    }
  }
}
