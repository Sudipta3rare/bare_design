import 'package:bare_design/models/product_list_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController{
  static CartController to = Get.find();

  RxList<ProductListModel> cartProducts = <ProductListModel>[].obs;
  RxDouble totalPrice = 0.00.obs;


  void addToCart(ProductListModel product) {
    // product.quantity++;
    if(!cartProducts.contains(product)) {
      cartProducts.add(product);
      product.quantity++;
    }
    else{
      for(var i in cartProducts){
        if(i.productId == product.productId){
          product.quantity++;
        }
      }
    }
    // cartProducts.assignAll(cartProducts);
    calculateTotalPrice();
    // update();
  }

  void increaseItemQuantity(ProductListModel product) {
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(ProductListModel product) {
    product.quantity--;
    if(product.quantity == 0){
      cartProducts.remove(product);

    }
    calculateTotalPrice();
    update();
  }


  bool get isEmptyCart => cartProducts.isEmpty;

  // bool isPriceOff(Product product) => product.off != null;

  void calculateTotalPrice() {
    totalPrice.value = 0.00;
    for (var element in cartProducts) {
      totalPrice.value += element.quantity * int.parse(element.productPrice);

      // if (isPriceOff(element)) {
      //   totalPrice.value += element.quantity * element.off!;
      // } else {
      //   totalPrice.value += element.quantity * element.price;
      // }
    }
  }
   String getCurrentSize(){
    return "M";
    }
   getCartItems(){
    // cartProducts.value =[
    //   ProductListModel(
    //       productId: "1",
    //       productImage: "assets/pr1.jpg",
    //       productName: "Product Name",
    //       productPrice: "120"
    //   ),    ProductListModel(
    //       productId: "2",
    //       productImage: "assets/pr2.jpg",
    //       productName: "Product Name",
    //       productPrice: "120"
    //   ),
    // ];
    // update();
   }
}