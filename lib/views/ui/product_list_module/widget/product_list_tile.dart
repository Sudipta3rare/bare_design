import 'package:bare_design/models/product_list_model.dart';
import 'package:bare_design/views/ui/product_module/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:get/get.dart';
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
      child: InkWell(

        onTap: (){
          Get.to(SingleProductPage());
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
                      LineIcon.heartbeat(
                        color: AppColors.buttonColor,
                      ),


                      LineIcon.plus(
                        color: AppColors.paragraphColor,
                      ),
                      // plus button

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}