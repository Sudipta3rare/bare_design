import 'dart:ui';

import 'package:bare_design/utils/appColors.dart';
import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../../../utils/dimens.dart';
import '../../../utils/themes.dart';
import '../../components/applicaiton_bar.dart';
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:
                LineIcon.readme(color: AppColors.buttonColor,
                size: 30,),
                 // Change Custom Drawer Icon Color

              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // leading: (LineIcon.list(
        //   color: AppColors.buttonColor,
        // )),
        title: Image.asset("assets/logo.png",
        height: 100,
        width: 100,),

        actions: [
        SizedBox(
          width: 40,
          child: IconButton(onPressed: (){}, icon: LineIcon.search(
            color: AppColors.buttonColor,
          )),
        ), SizedBox(
            width: 40,
          child: IconButton(onPressed: (){}, icon: LineIcon.heart(
            color: AppColors.buttonColor,
          )),
        ), SizedBox(
            width: 40,
          child: IconButton(onPressed: (){}, icon: LineIcon.shoppingBag(
            color: AppColors.buttonColor,
          )),
        ),
          SizedBox(
            width: 10,
          ),
      ],
      ),

      drawer: Drawer(
      child: BackdropFilter(
      filter: ImageFilter.blur(
    sigmaX: 1.0,
    sigmaY: 1.0,
    ),
        child: ListView(
          shrinkWrap: true,
          children:  [
            _drawerHeader(context),
           ListView.builder(
             shrinkWrap: true,
             itemCount: 1,
             itemBuilder: (context,int index) {
               return  Card(
                 color: AppColors.scaffoldColor,
                 child: ExpansionTile(title: Text("Categories", ),

                 textColor: AppColors.paragraphColor,
                 backgroundColor: AppColors.shadowColor,
                 collapsedTextColor: AppColors.paragraphColor,
                 iconColor: AppColors.paragraphColor,
                 childrenPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                       child: Text("Product Type",style: Styles().p2TextStyle(color: AppColors.accentColor),),
                     )
                   ],)
                 ],),
               );
             }
           ),
            ListTile(
              title: Text("Test1"),
            )
          ],
        ),
      )),


      bottomNavigationBar: BottomBarBubble(
        height: 60,
        backgroundColor: AppColors.primaryColor,
        onSelect: (index){},
        color: AppColors.buttonColor,
        items: [
          BottomBarItem(iconData:  Icons.home, label: "Home",),
          BottomBarItem(iconData:  Icons.format_list_bulleted_outlined, label: "Categories"),
          BottomBarItem(iconData:  Icons.local_fire_department_outlined, label: "Hot or Not"),
          BottomBarItem(iconData:  Icons.person, label: "Account"),
        ]
      ) ,


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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('user', style: Styles().p1TextStyle()),
                  Text('test@example.com',style:  Styles().p2TextStyle(color: AppColors.primaryColor),),
                ],
              ),
            ],
          ),)
    );
  }
}