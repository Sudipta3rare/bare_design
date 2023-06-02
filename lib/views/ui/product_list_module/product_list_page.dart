import 'package:bare_design/controllers/product_list_controller.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/ui/product_list_module/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../utils/themes.dart';
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


      body: SafeArea(
        child: GetBuilder<ProdcutListController>(
          builder: (ctrl) {
            return GridView.builder(
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
        ),
      ),
    );
  }
}
