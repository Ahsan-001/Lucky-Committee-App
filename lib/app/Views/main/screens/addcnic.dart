import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Models/cnicModel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/bottomNavigation.dart';
import 'package:pk_cnic_input_field/pk_cnic_input_field.dart';

import 'Home/democard.dart';
import 'package:http/http.dart' as http;

Future<ChangeCNICResponse> changeCNIC(String token, String cnic) async {
  final url = Uri.parse('https://perpaycommittee.com/api/change-cnic-umber');
  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: {'cnic_number': cnic},
  );
  if (response.statusCode == 200) {
    return ChangeCNICResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to change CNIC');
  }
}

class AddCNIC extends StatefulWidget {
  String token;

  AddCNIC({Key? key, required this.token}) : super(key: key);

  @override
  State<AddCNIC> createState() => _AddCNICState();
}

class _AddCNICState extends State<AddCNIC> {
  Future<ChangeCNICResponse> changeCNIC(String token, String cnic) async {
    final url = Uri.parse('https://perpaycommittee.com/api/change-cnic-umber');
    final response = await http(
      url,
      headers: {'Authorization': 'Bearer $token'},
      body: {'cnic_number': cnic},
    );
    if (response.statusCode == 200) {
      return ChangeCNICResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to change CNIC');
    }
  }

  @override
  void initState() {
    _token = widget.token;
    super.initState();
  }

  // TextEditingController email = TextEditingController();
  final isObsecure = true.obs;
  // String cnic = "";
  final isLoading = false.obs;
  String _token = '';
  String _cnic = '';
  bool _isLoading = false;
  void _handleChangeCNIC() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await changeCNIC(_token, _cnic);
      print(_token);
      print(response);
      print('success');
      setState(() {
        _isLoading = false;
      });
      Get.snackbar('success', 'CNIC Number Changed Successfully',
          backgroundColor: Colors.green);
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar('Failed', 'CNIC Number Changed UnSuccessfully',
          backgroundColor: Colors.red);

      print(_token);
      print(e.toString());
      print(_cnic);
      print('failed');
    }
  }

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
        // title: const Text("Computerized National Identity Card (CNIC)"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: WaveClipperOne(
                flip: true,
              ),
              child: Container(
                height: 140,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [kBrownColor, kMainColor2],
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Computerized National Identity Card (CNIC)",
                    textAlign: TextAlign.center,
                    style: h25HeadingWhiteBold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Add your CNIC number",
              style: h20HeadingBlackBold,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PKCNICInputField(
                prefixIconColor: kMainColor2,
                onChanged: (value) => setState(() => _cnic = value),
              ),
            ),
            // TextField(
            //   decoration: const InputDecoration(
            //     labelText: 'CNIC Number',
            //   ),
            //   onChanged: (value) => setState(() => _cnic = value),
            // ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your CNIC is: $_cnic",
              style: h13HeadingBlackBold,
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InkWell(
                onTap: _handleChangeCNIC,
                // Get.to(
                //     duration: const Duration(milliseconds: 400),
                //     transition: Transition.rightToLeft,
                //     BottomNavigation());

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
                  child: _isLoading == true
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

            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
