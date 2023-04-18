import 'package:get/get.dart';

class CheckController1 extends GetxController {
  var checkbool = false.obs;
}

class SerivceTypeDropDownController extends GetxController {
  final selected = "".obs;
  final listType = [
    "Balochistan",
    "Khyber PakhtunKhwa",
    "Punjab",
    "Sindh",
  ];
  void setSelected(String value) {
    selected.value = value;
  }
}
