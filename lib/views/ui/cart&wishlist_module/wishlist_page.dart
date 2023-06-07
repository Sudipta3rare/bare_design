import 'package:bare_design/controllers/cart_controller.dart';
import 'package:bare_design/views/ui/cart&wishlist_module/widgets/cart&wishllist_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

import '../../../controllers/wishlist_controller.dart';
import '../../../models/product_list_model.dart';
import '../../../utils/appColors.dart';
import '../../components/applicaiton_bar.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return ApplicationBar(
      title: "My Wishlist",
    );
  }
  Widget EmptyWishlist(){
    return Center(
      child: Text("Add Items To Wishlist"),
    );
  }


  Widget wishList() {
    return
      GetBuilder<WishlistController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.wishlistProducts.length,
              itemBuilder: (context, index) {
                print(controller.wishlistProducts.length);
                ProductListModel product = controller.wishlistProducts[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15),
                  // padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // spacing: 5,
                    // runSpacing: 5,
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    // alignment: WrapAlignment.spaceEvenly,
                    children: [
                      CartTile().tileImage(context, product),
                      CartTile().tileProductInfo( context,  product, controller),
                      GetBuilder<CartController>(
                        builder: (cartCtrl) {
                          return InkWell(
                            onTap: () {
                              cartCtrl.addToCart(controller.wishlistProducts[index]);
                              Get.toNamed("/cartPage");
                            },
                            child: SizedBox(
                              height: 100,
                              width: 50,
                              child: Stack(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Positioned(
                                  bottom: 60,
                              child: IconButton(onPressed: (){controller.decreaseItemQuantity(product);}, icon:   Icon(Icons.cancel_outlined, color: AppColors.buttonColor,),)),
                                  Positioned(
                                    bottom: 10,
                                    child: Container(

                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.buttonColor,
                                      ),
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                );
              },
            );
          }
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _appBar(context),
      body: GetBuilder<WishlistController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: !controller.isEmptyWishlist ? wishList() :  EmptyWishlist(),
                ),
                // bottomBarTitle(),
                // bottomBarButton()
              ],
            );
          }
      ),
    );
  }
}
