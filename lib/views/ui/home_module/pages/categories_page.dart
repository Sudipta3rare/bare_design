import 'package:bare_design/controllers/category_controller.dart';
import 'package:bare_design/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/appColors.dart';
import '../../../../utils/themes.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (ctrl) {
        return SingleChildScrollView(
          child: Column(
            children: List.generate(ctrl.categoryList.length, (index) => Card(
              color: AppColors.primaryColor,
              child: ExpansionTile(title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/ls1bgr.png", height: 60,scale: 2,),
                  Text(ctrl.categoryList[index],style: Styles().sH1TextStyle(), ),
                ],
              ),
                // leading:

                textColor: AppColors.paragraphColor,
                backgroundColor: AppColors.shadowColor,
                collapsedTextColor: AppColors.paragraphColor,
                iconColor: AppColors.paragraphColor,
                // childrenPadding: EdgeInsets.fromLTRB(20, 0, 10, 20),
                tilePadding: Dimens.bodyPadding1,
                children: [
                  ExpansionTile(title: Text("Sub-Category"),
                    textColor: AppColors.paragraphColor,
                    backgroundColor: AppColors.scaffoldColor,
                    collapsedTextColor: AppColors.paragraphColor,
                    iconColor: AppColors.paragraphColor,
                    collapsedIconColor: AppColors.paragraphColor,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(

                            onTap:(
                                ){
                              Get.toNamed('/productList');
                            },
                            child: Text("Product Type",style: Styles().p2TextStyle(color: AppColors.accentColor),)),
                      )
                    ],)
                ],),
            ),
            ),
          ),
        );
      }
    );
  }
}
