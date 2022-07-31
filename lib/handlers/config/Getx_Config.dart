// ignore_for_file: file_names

import 'package:crawllet/handlers/controllers/Forgot_Screen_controller.dart';
import 'package:crawllet/handlers/controllers/Home_Screen_controller.dart';
import 'package:crawllet/handlers/controllers/Login_Screen_Controller.dart';
import 'package:crawllet/handlers/controllers/Signup_Screen_Controller.dart';
import 'package:get/get.dart';

class GetxConfig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<SignupScreenController>(() => SignupScreenController());
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
    Get.lazyPut<ForgotScreenController>(() => ForgotScreenController());
  }
}