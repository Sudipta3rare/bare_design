import 'package:bare_design/models/product_list_model.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/utils/apptheme.dart';
import 'package:bare_design/utils/dimens.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:bare_design/views/ui/product_module/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controllers/cart_controller.dart';
import '../../components/animated_switcher_wrapper.dart';
import '../cart&wishlist_module/widgets/cart&wishllist_widgets.dart';
class CheckoutPage extends StatelessWidget {
   CheckoutPage({super.key,
     // required this.product
   });

  // ProductListModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: ApplicationBar(
        title: "Checkout",
        leading: BackButton(
          color: AppColors.buttonColor,
          onPressed: (){
            Get.back();
          },
        ),
      ),

      body: _showBody(context),
    );
  }

  Widget _showBody(context){
    return CustomScrollView(
      slivers: [
        cartList(),
        personalInfo(),
      ],
    );
  }
Widget personalInfo(){
    return SliverList(
    delegate: SliverChildListDelegate(
      [

        _addressFeild("Name"),
        _mobilenumberForm(),
        _addressFeild("Address"),
        Row(
          children: [
            Expanded(child: _addressFeild("Zip Code")),
            Expanded(child: _addressFeild("City")),
          ],
        ),Row(
          children: [
            Expanded(child: _addressFeild("State")),
            Expanded(child: _addressFeild("Country")),
          ],
        ),

      GetBuilder<CartController>(
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.only( top: 15),
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
      ),


        Container(
          padding: Dimens.containerPadding,
          height: 120,
          width: Get.width,
          child: ElevatedButton(onPressed: (){}, child: Text("Continue"),
          style: AppThemes.primaryButtonStyle,),
        )

      ]
    ),
    );
}
   Widget _addressFeild(title){
     return  Padding(
       padding:  EdgeInsets.only(
           left: 15.0, right: 15.0, top: 15, bottom: 0),
       child: TextField(
         // controller: mobileNumberController,

         decoration:  InputDecoration(
           labelText: title,
           labelStyle: TextStyle(color: AppColors.buttonColor),
           border: OutlineInputBorder(
             borderSide: BorderSide(color: AppColors.buttonColor),
           ),
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: AppColors.buttonColor),
           ),
           fillColor: Colors.white,
           filled: true,
         ),
       ),
     );
   }

Widget _mobilenumberForm(){
    return  Padding(
      padding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 15, bottom: 0),
      child: TextField(
        // controller: mobileNumberController,
        keyboardType: TextInputType.phone,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration: const InputDecoration(
          labelText: 'Mobile Number',
          labelStyle: TextStyle(color: AppColors.buttonColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
}

   Widget cartList() {
     return
       GetBuilder<CartController>(
           builder: (controller) {
             return SliverList(delegate: SliverChildBuilderDelegate(
                   childCount: controller.cartProducts.length,
                   (context, index) {
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
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   // spacing: 8,
                   // runSpacing: 8,
                   // crossAxisAlignment: WrapCrossAlignment.center,
                   // alignment: WrapAlignment.spaceEvenly,
                   children: [
                     CartTile().tileImage(context, product),
                     CartTile().tileProductInfo( context,  product, controller),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:8, right: 8),
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
                              AnimatedSwitcherWrapper(
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

                              ),
                              IconButton(

                                splashRadius: 10.0,
                                onPressed: () =>
                                    controller.increaseItemQuantity(product),
                                icon: const Icon(Icons.add, color: AppColors.buttonColor,),
                              ),
                            ],
                          ),
                        ),
                         Container(
                           margin: EdgeInsets.only(left:8, right: 8),

                           child: TextButton(onPressed: (){
                             Get.to(SingleProductPage(product: product));
                           }, child: Text("View Product")
                               , style: AppThemes.secondaryButtonStyle,),
                         ),
                      ],
                    ),
                   ],
                 ),
               );
             },));

           }
       );
   }
}
