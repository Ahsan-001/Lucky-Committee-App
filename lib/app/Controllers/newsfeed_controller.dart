import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsFeedController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
