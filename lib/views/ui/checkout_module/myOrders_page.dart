import 'package:bare_design/controllers/my_orders_controller.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../models/product_list_model.dart';
import '../../../utils/apptheme.dart';
import '../../../utils/themes.dart';
import '../cart&wishlist_module/widgets/cart&wishllist_widgets.dart';
import '../product_module/single_product_page.dart';


class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: ApplicationBar(
        title: "My Orders List",
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
        orderList()
      ],
    );
}
  Widget orderList() {
    return
      GetBuilder<MyOrderController>(
          builder: (controller) {
            return SliverList(delegate: SliverChildBuilderDelegate(
              childCount: controller.myOrdersList.length,
                  (context, index) {
                print(controller.myOrdersList.length);
                ProductListModel product = controller.myOrdersList[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(15),
                  // padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // spacing: 8,
                        // runSpacing: 8,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        // alignment: WrapAlignment.spaceEvenly,
                        children: [
                          CartTile().tileImage(context, product),
                          CartTile().tileProductInfo( context,  product, controller),

                          Container(
                            margin: EdgeInsets.only(left:8, right: 8),

                            child: TextButton(onPressed: (){
                              Get.to(SingleProductPage(product: product));
                            }, child: Text("View Product")
                              , style: AppThemes.secondaryButtonStyle,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [                        Text("Order Date: 12/4/2023"),

                            Text("Delivery Date: 17/4/2023"),

                          ],

                        ),
                      ),
                      Divider(thickness: 1,color: AppColors.buttonColor,),

                      Padding(
                        padding: const EdgeInsets.only( bottom: 16.0,
                        left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Rate this product", style: Styles().h4TextStyle(),),
                            ),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 0,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2),
                              itemBuilder: (context, _) => Icon(Icons.star,color:  Colors.amber),
                              onRatingUpdate: (index){
                                controller.update();
                              },
                            ),
                            // Text("Only Customer who have order the product can rate", style: Styles().p2TextStyle(color: AppColors.buttonColor),),
                          ],
                        ),
                      )

                    ],
                  ),
                );
              },));

          }
      );
  }
}


