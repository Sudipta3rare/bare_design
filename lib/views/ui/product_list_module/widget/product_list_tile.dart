import 'package:bare_design/controllers/product_list_controller.dart';
import 'package:bare_design/controllers/wishlist_controller.dart';
import 'package:bare_design/models/product_list_model.dart';
import 'package:bare_design/views/ui/product_module/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:get/get.dart';
import '../../../../controllers/cart_controller.dart';
import '../../../../utils/appColors.dart';
import '../../../../utils/themes.dart';
class ProductListTile extends StatelessWidget{
  ProductListTile({super.key, required this.product});

  ProductListModel product ;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GetBuilder<ProductListController>(
        builder: (ctrl) {
          return InkWell(

            onTap: (){
              ctrl.goToSingleProductPage(product);

            },

            child: Container(

              decoration: BoxDecoration(
                // color: Colors.pink[50]!.withOpacity(0.7),
                // color: AppColors.scaffoldColor,
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            product.productId,
                            style: Styles().p2TextStyle()
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '\$${product.productPrice}',
                            style: Styles().p1TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),

                    // donut picture
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(product.productImage)),
                    ),

                    // donut flavor
                    Text(
                      product.productName,
                      style: Styles().sH2TextStyle(),),


                    // love icon + add button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // love icon
                         GetBuilder<WishlistController>(
                            builder: (wishlistCtrl) {
                              return GestureDetector(
                                onTap: (){
                                  wishlistCtrl.addToWishlist(product);
                                  // wishlistCtrl.update();
                                  print(wishlistCtrl.wishlistProducts.length);
                                  Get.toNamed("/wishlistPage");
                                },
                                child: LineIcon.heartbeat(
                                  color: AppColors.buttonColor,
                                ),
                              );
                            }
                          ),

                        SizedBox(width: 10,),
                              GetBuilder<CartController>(
                            builder: (ctrl) {
                              return GestureDetector(
                                onTap: (){
                                  ctrl.addToCart(product);
                                  ctrl.update();
                                  print(ctrl.cartProducts.length);
                                  Get.toNamed("/cartPage");
                                },
                                child: LineIcon.plus(
                                  color: AppColors.paragraphColor,
                                ),
                              );
                            }
                          ),
                          // plus button

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

}