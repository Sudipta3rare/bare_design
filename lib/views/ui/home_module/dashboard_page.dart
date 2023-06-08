import 'dart:ui';

import 'package:bare_design/controllers/account_controller.dart';
import 'package:bare_design/controllers/category_controller.dart';
import 'package:bare_design/controllers/dashboardController.dart';
import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:bare_design/views/ui/home_module/pages/account_page.dart';
import 'package:bare_design/views/ui/home_module/pages/categories_page.dart';
import 'package:bare_design/views/ui/home_module/pages/home_page.dart';
import 'package:bare_design/views/ui/home_module/pages/hotOrNot_page.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icon.dart';

import '../../../utils/dimens.dart';
import '../../../utils/themes.dart';


class DashboardPage extends StatelessWidget {
   DashboardPage({Key? key}) : super(key: key);
DashboardController ctrl = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,


      appBar: ApplicationBar(
        logo:  Image.asset("assets/logo.png",
          height: 100,
          width: 100,),
        leading:Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon:
              Icon(Icons.menu_open_sharp, color: AppColors.buttonColor,size: 36,),
               // Change Custom Drawer Icon Color

            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      ),

      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   elevation: 0,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon:
      //           LineIcon.readme(color: AppColors.buttonColor,
      //           size: 30,),
      //            // Change Custom Drawer Icon Color
      //
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      //   // leading: (LineIcon.list(
      //   //   color: AppColors.buttonColor,
      //   // )),
      //   title: Image.asset("assets/logo.png",
      //   height: 100,
      //   width: 100,),
      //
      //   actions: [
      //   SizedBox(
      //     width: 40,
      //     child: IconButton(onPressed: (){}, icon: LineIcon.search(
      //       color: AppColors.buttonColor,
      //     )),
      //   ), SizedBox(
      //       width: 40,
      //     child: IconButton(onPressed: (){
      //       Get.toNamed("/wishlistPage");
      //     }, icon: LineIcon.heart(
      //       color: AppColors.buttonColor,
      //     )),
      //   ), SizedBox(
      //       width: 40,
      //     child: IconButton(onPressed: (){
      //       Get.toNamed("/cartPage");
      //     }, icon: LineIcon.shoppingBag(
      //       color: AppColors.buttonColor,
      //     )),
      //   ),
      //     SizedBox(
      //       width: 10,
      //     ),
      // ],
      // ),

      drawer: Drawer(
      child: BackdropFilter(
      filter: ImageFilter.blur(
    sigmaX: 1.0,
    sigmaY: 1.0,
    ),
        child: GetBuilder<CategoryController>(
          builder: (categoryCtrl) {
            return Column(

              children:  [
                _drawerHeader(context),
               Expanded(
                 child: ListView.builder(
                   // shrinkWrap: true,
                   itemCount: categoryCtrl.categoryList.length,
                   itemBuilder: (context,int index) {
                     return  Card(
                       color: AppColors.scaffoldColor,
                       child: ExpansionTile(title: Text(categoryCtrl.categoryList[index] ),
                       textColor: AppColors.paragraphColor,
                       backgroundColor: AppColors.shadowColor,
                       collapsedTextColor: AppColors.paragraphColor,
                       iconColor: AppColors.paragraphColor,
                       childrenPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                       leading: LineIcon.tShirt(
                         color: AppColors.buttonColor,
                       ),
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
                     );
                   }
                 ),
               ),
              ],
            );
          }
        ),
      )),


      bottomNavigationBar: BottomBarBubble(
        height: 60,
        backgroundColor: AppColors.primaryColor,
        onSelect: (index){
      ctrl.controller.jumpToPage(index);
      print(index);
      ctrl.update();

        },
        color: AppColors.buttonColor,
        items: [
          BottomBarItem(iconData:  Icons.home, label: "Home",),
          BottomBarItem(iconData:  Icons.format_list_bulleted_outlined, label: "Categories"),
          BottomBarItem(iconData:  Icons.local_fire_department_outlined, label: "Hot or Not"),
          BottomBarItem(iconData:  Icons.person, label: "Account"),
        ]
      ) ,



      body: PageView(
        controller: ctrl.controller,
        children: <Widget>[
         HomePage(),
         CategoriesPage(),
          HotPage(),
        AccountPage(),

        ],
      ),

    );
  }

  Widget _drawerHeader(context){
    return   SizedBox(
        height: 100,
        child: DrawerHeader(
          decoration: BoxDecoration(
              color: AppColors.buttonColor
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimens.largeSpace),
                width: 35,
                height: 35,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  backgroundColor: AppColors.paragraphColor,
                  child: Icon(
                    Icons.check,

                    size: Dimens.iconSize,),
                ),
              ),
              SingleChildScrollView(
                child: GetBuilder<AccountController>(
                  builder: (accCtrl) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(accCtrl.fullName, style: Styles().p1TextStyle()),
                        Text(accCtrl.mobile, style:  Styles().p2TextStyle(color: AppColors.primaryColor),),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),)
    );
  }
}
