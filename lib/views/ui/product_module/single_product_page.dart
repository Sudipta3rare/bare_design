

import 'package:bare_design/controllers/single_product_controller.dart';
import 'package:bare_design/utils/apptheme.dart';
import 'package:bare_design/utils/dimens.dart';
import 'package:bare_design/utils/themes.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/appColors.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: ApplicationBar(
        title: "Product Page",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.secondaryColor,
          onPressed: (){
            Get.back();
          },
        ),
      ),
      
      body: _showBody(context),


      bottomSheet: _bottomSheetButton(context),

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
                Text("Product Name", style: Styles().h2TextStyle(),),
                Text(" \$ 120", style: Styles().h2TextStyle(),),
              ],
            ),
            trailing: Icon(Icons.favorite,
            color: AppColors.buttonColor,),
            ),


            //Size selection widget
            _sizeSelectionWidget(context, ctrl),


            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,


                borderRadius: BorderRadius.circular(2),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(5),
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
            ),
        SizedBox(height: 80,)
          ],
        );
      }
    );
 }

 Widget _carousalWidget(context){
    return Stack(
        children: [
          CarouselSlider(items: [
          Image.asset("assets/pr2.jpg",),
          Image.asset("assets/pr1.jpg",),
          Image.asset("assets/pr3.jpg",),
          Image.asset("assets/pr4.jpg",),
          Image.asset("assets/pr5.jpg",),
        ], options: CarouselOptions(
          height: 400,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 900),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.23,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        )),
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
                                  ? Colors.white
                                  : Colors.blue),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: Get.width/2.4 ,
            child: ElevatedButton(onPressed: (){}, child: Text("Add TO Cart"),
              style: AppThemes.secondaryButtonStyle,),
          ),
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
