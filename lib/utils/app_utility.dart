import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'appColors.dart';
import 'constants.dart';


class AppUtility {
  AppUtility();

  // Global Functions
  double contentHeight(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return mediaHeight;
  }

  // Global Functions
  double bodyHeight(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        kBottomNavigationBarHeight -
        contentHeight(context) * .4 -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return mediaHeight;
  }

  double contentWidth(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    return mediaHeight;
  }

  MediaQueryData scaleFactor(
      {required BuildContext context, double scale = 1.0}) {
    return MediaQuery.of(context).copyWith(textScaleFactor: scale);
  }

  static Future<bool> checkNetworkConn() async {
    bool isNetwork = false;
    bool? isPhysical;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      isPhysical = androidInfo.isPhysicalDevice;
      if (isPhysical!) {
        try {
          final List<InternetAddress> result =
          await InternetAddress.lookup(Constant.appSiteUrl);
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            isNetwork = true;
          }
        } on SocketException catch (_) {
          isNetwork = false;
        }
      } else {
        isNetwork = true;
      }
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      isPhysical = iosInfo.isPhysicalDevice;
      if (isPhysical) {
        try {
          final List<InternetAddress> result =
          await InternetAddress.lookup(Constant.appSiteUrl);
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            isNetwork = true;
          }
        } on SocketException catch (_) {
          isNetwork = false;
        }
      } else {
        isNetwork = true;
      }
    }
    return isNetwork;
  }

  void showSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: AppColors.titleColor,
              fontSize: 16,
              fontFamily: 'RobotoRegular'),
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // Some code to undo the change!
          },
        ),
      ),
    );
  }

  void showGetSnackBar({required String title, required String message}) {
    Get.snackbar(
      "",
      "",
      titleText: Text(
        title,
        style: const TextStyle(color: AppColors.errorColor, fontSize: 16),
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.titleColor,
      messageText: Text(
        message,
        style: const TextStyle(
          color: AppColors.titleColor,
          fontSize: 16,
        ),
      ),
      backgroundColor: AppColors.iconInactiveColor,
      isDismissible: true,
    );
  }
}
