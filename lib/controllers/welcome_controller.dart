import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  static WelcomeController to = Get.find();

  late AnimationController controller;
  late Animation<double> animation;

  void goToDashboard(){
    Get.offAllNamed('/dashboard');
  }
}