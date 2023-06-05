import 'package:get/get.dart';

class SingleProductController extends GetxController{
  static SingleProductController to = Get.find();

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