import 'package:bare_design/utils/appColors.dart';
import 'package:bare_design/utils/dimens.dart';
import 'package:bare_design/views/components/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/themes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> productColors = [
    "assets/pr4.jpg",
        "assets/pr2.jpg",
        "assets/pr3.jpg",
        "assets/pr8.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                9,
                (index) => SizedBox(
                    height: 120, child: headerCategory(context, index))),
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 3,
              (BuildContext context, int childIdx) {
        print('Building block  child $childIdx');
        return Padding(
            padding: EdgeInsets.all(8), child: _buildPageLayout(context));
      }))
    ]);
  }

  Widget _buildPageLayout(context) {
    return Column(children: [
      CustomCarouselSlider(items: productColors, height: Get.height/2,),
      

      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/sticker1.png",
                height: Get.height / 18,
                width: Get.width / 3.3,
              ),
              Image.asset(
                "assets/sticker2.png",
                height: Get.height / 18,
                width: Get.width / 3.3,
              ),
              Image.asset(
                "assets/sticker3.png",
                height: Get.height / 18,
                width: Get.width / 3.3,
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Image.asset(
          "assets/bra1.jpg",
          width: Get.width,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),

        child: Image.asset(
          "assets/bra2.jpg",
          width: Get.width,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),

        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Trending Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.asset(
                        productColors[index],
                        height: Get.height / 4,
                      ),
                      Padding(
                        padding: Dimens.textPadding,
                        child: Text(
                          "Product Name",
                        ),
                      ),
                      Text("\$ 120"),
                    ],
                  ),
                );
              }
              ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget headerCategory(context, index) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.buttonColor.withOpacity(0.5),
                radius: 36,
              ),
              Positioned(
                  bottom: 0,
                  left: 13,
                  child: index % 2 == 0
                      ? Image.asset(
                          "assets/ls2bgr.png",
                          height: 70,
                          fit: BoxFit.scaleDown,
                          scale: 0.8,
                        )
                      : Image.asset(
                          "assets/ls1bgr.png",
                          height: 70,
                        )),
            ],
          ),
          Padding(
            padding: Dimens.textPadding,
            child: Text(
              "Category",
              style: Styles().customTextStyle(),
            ),
          )
        ],
      ),
    );
  }
}
