import 'package:get/get.dart';

class SingleProductController extends GetxController{
  static SingleProductController to = Get.find();

  final List<String> sizes = ["S","M","L"];
  RxString selectedSize = ''.obs;
  late void Function(String) onSizeSelected;
}