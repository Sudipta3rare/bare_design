import 'package:bare_design/models/product_list_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistController extends GetxController{
  static WishlistController to = Get.find();

  RxList<ProductListModel> wishlistProducts = <ProductListModel>[].obs;
  void addToWishlist(ProductListModel product){
    if(!wishlistProducts.contains(product)){
      wishlistProducts.add(product);
    }
  }
  bool get isEmptyWishlist => wishlistProducts.isEmpty;
  bool productInWishlist(ProductListModel product){
    return wishlistProducts.contains(product);
  }

  void removeWishlist(ProductListModel product) {


      wishlistProducts.remove(product);


    update();
  }

  String getCurrentSize(){
    return "M";
  }
  void geWishlistItems(){
  }
}