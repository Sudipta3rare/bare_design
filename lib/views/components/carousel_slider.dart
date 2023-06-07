import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/appColors.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    Key? key,
    required this.items, this.height,
  }) : super(key: key);

  final List<String> items;
  final  height;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = Get.width;
    return Stack(
      children: [
        SizedBox(
          height: widget.height/1.5 ,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(widget.items[index], scale: 3),
              );
            },
          ),
        ),
        Positioned(
          bottom: Checkbox.width,
          left: width/2.5,
          child: SmoothIndicator(
            effect:  WormEffect(

              dotColor: Colors.white,
              activeDotColor: AppColors.buttonColor,
              dotHeight: 8,
              dotWidth: 8,
            ),
            offset: newIndex.toDouble(),
            count: widget.items.length, size:  Size(-(widget.items.length.toDouble()), 0),

          ),
        )
      ],
    );
  }
}