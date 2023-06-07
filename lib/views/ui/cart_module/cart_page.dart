import 'package:bare_design/controllers/cart_controller.dart';
import 'package:bare_design/models/product_list_model.dart';
import 'package:bare_design/utils/apptheme.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appColors.dart';
import '../../components/animated_switcher_wrapper.dart';
// final CartController controller = Get.put(CartController());

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return ApplicationBar(
      title: "My cart",
    );
  }

  Widget cartList() {
    return
      GetBuilder<CartController>(
        builder: (controller) {
          return ListView.builder(
          itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
            print(controller.cartProducts.length);
            ProductListModel product = controller.cartProducts[index];
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              // padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.fromLTRB(0,8,8,8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                      product.productImage,
                      // width: 100,
                      // height: 100,
                      ),),
                      borderRadius: BorderRadius.circular(10),
                      // color: ColorExtension.randomColor,
                      color: AppColors.buttonColor,

                    ),
                    child: SizedBox(height: 100,
                    width: 100,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        controller.getCurrentSize(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$ ${product.productPrice}",
                        // controller.isPriceOff(product)
                        //     ? "\$${product.off}"
                        //     : "\$${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      mainAxisSize: MainAxisSize.min,
                      children: [

                        IconButton(
                          splashRadius: 10.0,
                          onPressed: () =>
                              controller.decreaseItemQuantity(product),
                          icon: const Icon(
                            Icons.remove,
                            color: AppColors.buttonColor,
                          ),
                        ),
                        GetBuilder<CartController>(
                          builder: (CartController controller) {
                            return AnimatedSwitcherWrapper(
                              child: Text(
                                '${controller.cartProducts[index].quantity}',
                                key: ValueKey<int>(
                                  controller.cartProducts[index].quantity,
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(

                          splashRadius: 10.0,
                          onPressed: () =>
                              controller.increaseItemQuantity(product),
                          icon: const Icon(Icons.add, color: AppColors.buttonColor,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
    );
        }
      );
  }

  Widget bottomBarTitle() {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Obx(
                    () {
                  return AnimatedSwitcherWrapper(
                    child: Text(
                      "\$${controller.totalPrice.value}",
                      key: ValueKey<double>(controller.totalPrice.value),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      }
    );
  }

  Widget bottomBarButton() {
    return GetBuilder<CartController>(
      builder: (controller) {
        return SizedBox(
          width: double.infinity,
          height: Get.height/11,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: ElevatedButton(
              style: AppThemes.primaryButtonStyle,
              onPressed: controller.isEmptyCart ? null : () {},
              child: const Text("Buy Now"),
            ),
          ),
        );
      }
    );
  }

  Widget EmptyCart(){
    return Center(
      child: Text("Add Items To Cart"),
    );
  }

  @override
  Widget build(BuildContext context) {
    // controller.getCartItems();

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: _appBar(context),
      body: GetBuilder<CartController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: !controller.isEmptyCart ? cartList() :  EmptyCart(),
              ),
              bottomBarTitle(),
              bottomBarButton()
            ],
          );
        }
      ),
    );
  }
}