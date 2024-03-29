import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/account_model.dart';

class AccountController extends GetxController{
  static AccountController to = Get.find();

  @override
  Future<void> onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    fullName = _prefs.getString('fullName') ?? 'Hi dear';
    mobile = _prefs.getString('mobileNumber') ?? '';
  }

  late SharedPreferences _prefs;
  late String fullName;
  late String mobile;



  //
  // final savedFeild = GetStorage();
  //
  // Rx<UserDetails> user = UserDetails("", '', '', '', '','').obs;
  // //
  // TextEditingController fullNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController mobileNumberController = TextEditingController();
  // TextEditingController dobController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  // bool isDataDisplayed = false;
  //
  //
  // final formKey = GlobalKey<FormState>();
  //
  //
  // void storeUserDetials() async {
  //   await  savedFeild.write("UserName", user.value.name);
  //   await  savedFeild.write("gender", user.value.gender);
  //   await  savedFeild.write("dob", user.value.dob);
  //   await  savedFeild.write("mobile", user.value.mobile);
  //   await  savedFeild.write("pass", user.value.email);
  //   await  savedFeild.write("email", user.value.pass);
  //   update();
  // }
  //
  // UserDetails getUserDetails() {
  //   return savedFeild.read("userDetails");
  //
  // }
  //
  // @override
  // void onClose() {
  //   fullNameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   mobileNumberController.dispose();
  //   dobController.dispose();
  //   genderController.dispose();
  //   super.dispose();
  // }
}