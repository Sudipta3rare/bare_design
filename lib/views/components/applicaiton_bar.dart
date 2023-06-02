import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:line_icons/line_icon.dart';

import '../../utils/appColors.dart';

import '../../utils/dimens.dart';


class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  const ApplicationBar({
    Key? key,
    this.title = '',
    this.elevation = 0.0,
    this.titleStyle = const TextStyle(
      fontSize: Dimens.sH2Size,
      color: AppColors.titleColor,
    ),
    this.actions,
    this.leading,
    this.titleWidget,
    this.logo,
    this.centerTitle = false,
    this.logoutOnTap,
    this.backgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  final String title;
  final Widget? logo;
  final TextStyle titleStyle;
  final double elevation;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final bool? centerTitle;

  final Callback? logoutOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return actions != null
        ? AppBar(
      backgroundColor: backgroundColor,
      titleTextStyle: titleStyle,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.buttonColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
      centerTitle: true,
      title: titleWidget ??
          Text(
            title,
            style: titleStyle,
          ),
      actions: actions,
      elevation: elevation,
    )
        : AppBar(
      backgroundColor: backgroundColor,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Get.back(),
          ),
      centerTitle: centerTitle!,
      title: logo ?? titleWidget ??
          Text(
            title,
            style: titleStyle,
          ),
      elevation: elevation,
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
    );
  }
}
