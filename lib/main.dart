import 'package:bare_design/controllers/account_controller.dart';
import 'package:bare_design/controllers/cart_controller.dart';
import 'package:bare_design/controllers/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/product_list_controller.dart';
import 'controllers/welcome_controller.dart';
import 'launchers/mainApp.dart';

Future<void> main() async {
  await GetStorage.init();
  _initController();
  runApp(const MainApp());
}
void _initController(){
  Get.put<WelcomeController>(WelcomeController());
  Get.lazyPut<ProductListController>(() => ProductListController(),fenix: true);
  Get.lazyPut<SingleProductController>(() => SingleProductController(),fenix: true);
  Get.put<CartController>(CartController());
  Get.put<AccountController>(AccountController(),);
  // Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
}