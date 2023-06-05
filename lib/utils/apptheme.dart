import 'package:bare_design/utils/themes.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';


class AppThemes {
  AppThemes._();

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(color: AppColors.titleColor),
    bodyText1: TextStyle(color: AppColors.titleColor),
    bodyText2: TextStyle(color: AppColors.paragraphColor),
    button: TextStyle(color: AppColors.titleColor),
    headline6: TextStyle(color: AppColors.titleColor),
    subtitle1: TextStyle(color: AppColors.subTitleColor),
    caption: TextStyle(color: AppColors.titleColor),
  );



  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: AppColors.buttonTextColor, backgroundColor: AppColors.buttonColor,
    // textStyle: Styles().h3TextStyle(),
    shape: const RoundedRectangleBorder(

      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(

    foregroundColor: AppColors.iconActiveColor, backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: AppColors.buttonColor),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  static final ButtonStyle lightRaisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: AppColors.secondaryColor, backgroundColor: AppColors.secondaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: AppColors.primaryBrightness,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    canvasColor: AppColors.scaffoldColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      foregroundColor: AppColors.secondaryColor,
      iconTheme: IconThemeData(color: AppColors.secondaryColor),
      // textTheme: _lightTextTheme,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.lightBackgroundAlertColor,
        actionTextColor: AppColors.titleColor),
    iconTheme: const IconThemeData(
      color: AppColors.iconInactiveColor,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(style: lightRaisedButtonStyle),
    // outlinedButtonTheme: OutlinedButtonThemeData(style: _lightOutlineButtonStyle),
    popupMenuTheme: const PopupMenuThemeData(color: AppColors.primaryColor),
    textTheme: _lightTextTheme,
    applyElevationOverlayColor: true,
    inputDecorationTheme: const InputDecorationTheme(
      //prefixStyle: TextStyle(color: AppColors.lightIconColor),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDarkColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.secondaryColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.errorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: AppColors.primaryColor,
      //focusColor: AppColors.lightBorderActiveColor,
    ),
  );

//text theme for dark theme

  static const TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(color: AppColors.primaryColor),
    bodyText1: TextStyle(color: AppColors.primaryColor),
    bodyText2: TextStyle(color: AppColors.primaryColor),
    button: TextStyle(color: AppColors.primaryColor),
    headline6: TextStyle(color: AppColors.primaryColor),
    subtitle1: TextStyle(color: AppColors.primaryColor),
    caption: TextStyle(color: AppColors.primaryColor),
  );


  static final ButtonStyle darkRaisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: AppColors.secondaryColor, backgroundColor: AppColors.secondaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(32)),
    ),
  );

  //the dark theme

}
