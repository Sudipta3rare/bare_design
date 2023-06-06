import 'package:bare_design/controllers/product_list_controller.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/ui/product_list_module/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';


import '../../components/applicaiton_bar.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,

      appBar: ApplicationBar
        (title: "Product List",
         leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back, color: AppColors.accentColor,),),
      ),


      body: showBody(context),
    );
  }

  Widget showBody(context){
    return SafeArea(
      child: GetBuilder<ProductListController>(
          builder: (ctrl) {
            return Column(

                children:[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10.0,0,2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Image.asset("assets/sticker1.png",height: Get.height/18,width: Get.width/3.1,),
                        Image.asset("assets/sticker2.png",height: Get.height/18,width: Get.width/3.1,),
                        Image.asset("assets/sticker3.png",height: Get.height/18,width: Get.width/3.1,),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: List.generate(ctrl.category.length, (index) => _showCategoryTile(context, ctrl, index)),)),

                  SizedBox(height: 8,),
                  Expanded(child: grid(context))] );
          }
      ),
    );
  }
 Widget _showCategoryTile(context,ProductListController ctrl, index){
    return Container(

      color: AppColors.primaryColor,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      child: Text(ctrl.category[index]),
    );
 }
 Widget grid(BuildContext context){
    return GetBuilder<ProductListController>(
        builder: (ctrl) {
          return GridView.builder(
            // shrinkWrap: true,
            itemCount: ctrl.productList.length,
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.8,
            ),
            itemBuilder: (context, index) {
              return ProductListTile(
                product: ctrl.productList[index],
              );
            },
          );
        }
    );
 }
}
