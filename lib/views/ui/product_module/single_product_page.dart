

import 'package:bare_design/controllers/cart_controller.dart';
import 'package:bare_design/controllers/single_product_controller.dart';
import 'package:bare_design/models/product_list_model.dart';
import 'package:bare_design/utils/apptheme.dart';
import 'package:bare_design/utils/dimens.dart';
import 'package:bare_design/utils/themes.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


import '../../../utils/appColors.dart';
import '../../components/carousel_slider.dart';

class SingleProductPage extends StatelessWidget {
   SingleProductPage({super.key, required this.product});

  ProductListModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: ApplicationBar(
        title: "Product Page",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.buttonColor,
          onPressed: (){
            Get.back();
          },
        ),
      ),
      
      body: _showBody(context),

      bottomSheet: _bottomSheetButton(context),
      resizeToAvoidBottomInset: true,
    );

  }

 Widget _showBody(context){
    return GetBuilder<SingleProductController>(
      builder: (ctrl) {
        return ListView(
          // padding: Dimens.pagePadding,
          children: [
            _carousalWidget(context),


            ListTile(
              tileColor: AppColors.primaryColor,
              title: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Text(product.productName, style: Styles().h2TextStyle(),),
                Text(" \$ ${product.productPrice}", style: Styles().h2TextStyle(),),
              ],
            ),
            trailing: Icon(Icons.favorite,
            color: AppColors.buttonColor,),
            ),


            //Size selection widget
            _sizeSelectionWidget(context, ctrl),
//colors page
         ctrl.productColors.isNotEmpty ? _showProductColors(context, ctrl) : SizedBox(height:0),

            _showTabView(context),
          _showCard(context),


          _showSimilarProducts(context,ctrl),

        _showReviewBar(context,ctrl),

        _showCustomerReviews(context, ctrl),

        SizedBox(height: 80,)
          ],
        );
      }
    );
 }

 Widget     _showCustomerReviews(context, ctrl){
    return Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,


          borderRadius: BorderRadius.circular(2),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(4),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Reviews (10)", style: Styles().h4TextStyle(), ),
            Column(
              children: List.generate(4, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviewer Name"),
                          Text("4/5", style: Styles().p1TextStyle(color: AppColors.paragraphColor),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel euismod orci."),
                    ),
                    Divider(thickness: 2,color: AppColors.buttonColor,),
                  ],
                );
              }),
            ),
            TextButton(onPressed: (){}, child: Text("View All Reviews", style: Styles().sH2TextStyle(color: AppColors.buttonColor),),)
          ],
        )
    );
 }

 Widget _showSimilarProducts(context,SingleProductController ctrl){
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,


        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Similar Products", style: TextStyle(fontWeight: FontWeight.bold,),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(ctrl.productColors[index], height: Get.height/4,),
                      Padding(
                        padding: Dimens.textPadding,
                        child: Text("Product Name",),
                      ),
                      Text("\$ 120"),
                    ],
                  ),
                );
              })
            ),
          )
        ],
      ),
    );
 }
 
 Widget _showReviewBar(context,ctrl){
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      color: AppColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ratings", style: Styles().h4TextStyle(),),
          ),
          RatingBar.builder(
            initialRating: 4,
            minRating: 0,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, _) => Icon(Icons.star,color:  Colors.amber),
          onRatingUpdate: (index){
              ctrl.update();
          },
          ),
          Text("Only Customer who have order the product can rate", style: Styles().p2TextStyle(color: AppColors.buttonColor),),
        ],
      )
    );
 }

 Widget _showTabView(context) {
    return GetBuilder<SingleProductController>(
      builder: (ctrl) {
        return Card(
          color: AppColors.primaryColor,
          child: Column(
            children: <Widget>[
              TabBar(
                indicatorWeight: 1,
                unselectedLabelColor: AppColors.paragraphColor,
                indicatorColor: AppColors.buttonColor,
                labelColor: AppColors.buttonColor,
                dividerColor: AppColors.buttonColor,
                controller: ctrl.controller,
                tabs: ctrl.myTabs
              ),
            SizedBox(
              height: 300,
              child: TabBarView(
                  controller: ctrl.controller,
                  children: <Widget>[
                    Card(
                      margin: const EdgeInsets.all(16.0),
                      child: Text(product.productAbout
                      ,
                        overflow: TextOverflow.clip ,
                      ),

                    ),
                    Card(
                      margin: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Net Qty",)
                              ,Text("1 U", style: TextStyle(color: AppColors.buttonColor, fontWeight: FontWeight.bold),),
                              Text("Package Containes"),
                              Text("1 Number. of prodcut",style: TextStyle(color: AppColors.buttonColor, fontWeight: FontWeight.bold)),
                              Text ("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel euismod orci. Sed fermentum velit non sem pellentesque, ac eleifend neque pretium. Sed orci turpis, rutrum at mi eget, interdum aliquam sem. Maecenas sit amet nisi ut lacus ullamcorper elementum et in risus.",
                              style:  Styles().p2TextStyle(),
                              )
                            ]
                          )
                      ),
                    ),
                  ],
                ),
            ),
            ],
          ),
        );
      }
    );
 }

 Widget _showOurSectrects(context){
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(5),
          leading: Image.asset("assets/sa1.png"),
          title: Text("Fit Research", style:Styles().sH2TextStyle(),),
        ), ListTile(
          contentPadding: EdgeInsets.all(5),
          leading: Image.asset("assets/sa2.png"),
          title: Text("Designing & Manufacturing", style:Styles().sH2TextStyle(),),
        ), ListTile(
          contentPadding: EdgeInsets.all(5),leading: Image.asset("assets/sa3.png"),
          title: Text("Feedback Driven Approach", style:Styles().sH2TextStyle(),),
        ), ListTile(
          contentPadding: EdgeInsets.all(5), leading: Image.asset("assets/sa4.png"),
          title: Text("We Make In India", style:Styles().sH2TextStyle(),),
        ),
      ],
    );
 }

Widget _showCard(context){
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,

              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.check),
                    Text("Free Shipping", style: Styles().p2TextStyle()),
                    Icon(Icons.info_outline_rounded, size: 15,)
                  ],
                ),
                SizedBox(width: Get.width/6,),
                Row(
                  children: [
                    Icon(Icons.check),
                    Text("Return Policies", style: Styles().p2TextStyle()),
                    Icon(Icons.info_outline_rounded, size: 15,)
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(

                  children: [
                    Icon(Icons.check),
                    Text("COD Available", style: Styles().p2TextStyle()),
                    Icon(Icons.info_outline_rounded, size: 15,)
                  ],
                ),
                SizedBox(width: Get.width/6,),
                Row(
                  children: [
                    Icon(Icons.check),
                    Text("Discreet Packaging", style: Styles().p2TextStyle()),
                    Icon(Icons.info_outline_rounded, size: 15,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
}

 Widget _showProductColors(context, ctrl){
    return             Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,


        borderRadius: BorderRadius.circular(2),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Available Colours", style: Styles().h4TextStyle(),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => Padding(padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Image.asset(ctrl.productColors[index], height: 150, width: 100,
                      scale: 0.3,),
                    Text("Product Color", style: TextStyle(color: AppColors.paragraphColor),),
                  ],
                ),)),
            ),
          )
        ],
      ),
    );
 }

 Widget _carousalWidget(context){
    return Stack(
        children: [
          CustomCarouselSlider(items: [
            "assets/pr2.jpg",
            "assets/pr3.jpg",
            "assets/pr4.jpg",
            "assets/pr8.jpg",
            "assets/pr7.jpg",
          ],
          height: Get.height,),
          Positioned(
              left: Get.width*0.9,
              child: Container(
                margin: EdgeInsets.all(5),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.buttonColor)
                ),
                child: Icon(Icons.share_outlined, color: AppColors.buttonColor,size: 20,),
              )
          ),
        ]);
 }

  Widget _sizeSelectionWidget (context, ctrl){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Size", style: Styles().h4TextStyle(),),
            Row(
                children:
                List.generate(ctrl.sizes.length, (index) => Padding(padding: EdgeInsets.fromLTRB(0,8,8,6),
                  child: InkWell(
                    onTap: (){
                      ctrl.selectedSize.value = ctrl.sizes[index];
                      ctrl.update();},
                    child: Ink(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ctrl.selectedSize.value == ctrl.sizes[index]
                              ? AppColors.iconActiveColor
                              : AppColors.iconInactiveColor,
                          borderRadius: BorderRadius.circular(3)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          ctrl.sizes[index],
                          style: Styles().p1TextStyle(
                              color: ctrl.selectedSize.value == ctrl.sizes[index]
                                  ? AppColors.primaryColor
                                  : AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
                )
            ),
            Padding(
              padding: Dimens.textPadding,
              child: Text("View Size chart",
                style:Styles().p2TextStyle(color: AppColors.buttonColor),),
            ),
            Row(
              children: [
                Text("Can't find your size? ",style: TextStyle(color: AppColors.paragraphColor),),
                Text("Request your size", style: TextStyle(color: AppColors.buttonColor, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheetButton(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<CartController>(
              builder: (crtCtrl) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: Get.width/2.4 ,
                    child: ElevatedButton(onPressed: (){crtCtrl.addToCart(product);
                      Get.toNamed("/cartPage");}, child: Text("Add TO Cart"),
                      style: AppThemes.secondaryButtonStyle,),
                  ),
                );
              }

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: Get.width/2.1,
            child: ElevatedButton(onPressed: (){}, child: Text("Buy Now"),

              style: AppThemes.primaryButtonStyle,),
          ),
        ),


      ],);
  }
}
