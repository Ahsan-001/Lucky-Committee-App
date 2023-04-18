import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Controllers/checkController.dart';
import 'package:lucky_committee/app/Views/splash.dart';

void main() {
  runApp(const MyApp());
  Get.put(SerivceTypeDropDownController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      ///EasyLoading
      builder: EasyLoading.init(
        builder: (context, widget) {
          EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorType = EasyLoadingIndicatorType.ring
            ..loadingStyle = EasyLoadingStyle.light
            ..indicatorSize = 40
            ..radius = 10
            ..backgroundColor = Colors.transparent
            ..indicatorColor = Colors.amber
            ..maskColor = Colors.black
            ..dismissOnTap = false;
          return MediaQuery(
            ///Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),

      debugShowCheckedModeBanner: false,
      title: 'Lucky Committee',
      home: const SplashView(),
      // home: HomeScreen(),
    );
  }
}
