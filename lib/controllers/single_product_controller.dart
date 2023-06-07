import 'package:bare_design/controllers/product_list_controller.dart';
import 'package:bare_design/models/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController with GetSingleTickerProviderStateMixin{
  static SingleProductController to = Get.find();

   final List<Tab> myTabs = <Tab>[
    Tab(text: 'Description'),
    Tab(text: 'Additional Info'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  final List<String> sizes = ["S","M","L"];
  RxString selectedSize = ''.obs;
  late void Function(String) onSizeSelected;



  final List<String> productColors = [
    "assets/pr1.jpg",
    "assets/pr2.jpg",
    "assets/pr3.jpg",
    "assets/pr4.jpg",
  ];
}