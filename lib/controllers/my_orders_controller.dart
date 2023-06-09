import 'package:get/get.dart';

import '../models/product_list_model.dart';

class MyOrderController extends GetxController{
  static MyOrderController to = Get.find();
  List myOrdersList = <ProductListModel>[
    ProductListModel(
        productId: "1",
        productImage: "assets/pr1.jpg",
        productName: "Product Name",
        productPrice: "120"
    ),    ProductListModel(
        productId: "2",
        productImage: "assets/pr2.jpg",
        productName: "Product Name",
        productPrice: "120"
    ),    ProductListModel(
        productId: "3",
        productImage: "assets/pr3.jpg",
        productName: "Product Name",
        productPrice: "120"
    ),
  ];

  String getCurrentSize(){
    return "M";
  }
}