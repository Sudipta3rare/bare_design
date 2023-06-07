import 'package:bare_design/views/ui/product_module/single_product_page.dart';
import 'package:get/get.dart';

import '../models/product_list_model.dart';

class ProductListController extends GetxController{
  static ProductListController to = Get.find();


  List<String> category =["All","50 OFF", "60 OFF", "Non Padded","Full length","Tees", "Shorts","Activewear"];
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


  void goToSingleProductPage(ProductListModel product){

    Get.to(SingleProductPage(product: product));
  }
}