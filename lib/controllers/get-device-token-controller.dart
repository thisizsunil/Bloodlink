import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app-constant.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }///use of this method is when the class run  call automatically the method

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        deviceToken = token;
        print("token: $deviceToken");
        update();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryCotor,
        colorText: AppConstant.appTextCotor,
      );
    }
  }
}
