import 'package:get/get.dart';

import '../models/product_list_model.dart';

class ProdcutListController extends GetxController{
  static ProdcutListController to = Get.find();

  List<ProductListModel> productList = <ProductListModel>[
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
    ),    ProductListModel(
      productId: "4",
      productImage: "assets/pr4.jpg",
      productName: "Product Name",
      productPrice: "120"
    ),    ProductListModel(
      productId: "5",
      productImage: "assets/pr5.jpg",
      productName: "Product Name",
      productPrice: "120"
    ),    ProductListModel(
      productId: "6",
      productImage: "assets/pr6.jpg",
      productName: "Product Name",
      productPrice: "120"
    ),    ProductListModel(
      productId: "7",
      productImage: "assets/pr7.jpg",
      productName: "Product Name",
      productPrice: "120"
    ),    ProductListModel(
      productId: "8",
      productImage: "assets/pr8.jpg",
      productName: "Product Name",
      productPrice: "120"
    ),
  ];
}