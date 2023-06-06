import 'package:flutter/material.dart';



import 'appColors.dart';
import 'dimens.dart';


class Styles{
  Styles();


//-- Theme Text Style --//

  TextStyle h1TextStyle(){
    return const TextStyle(
      fontSize: Dimens.h1Size,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h2TextStyle(){
    return const TextStyle(
      fontSize: Dimens.h2Size,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3TextStyle(){
    return const TextStyle(
      fontSize: Dimens.h3Size,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h4TextStyle(){
    return const TextStyle(
      fontSize: Dimens.h4Size,
      fontWeight: FontWeight.w700,
    );
  }


  TextStyle sH2TextStyle({Color color = AppColors.paragraphColor}){
    return  TextStyle(
      fontSize: Dimens.sH2Size,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  TextStyle sH1TextStyle(){
    return const TextStyle(
      fontSize: Dimens.sH1Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle p1TextStyle({Color color = AppColors.paragraphColor}){
    return TextStyle(
      color: color,
      fontSize: Dimens.p1Size,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle p2TextStyle({Color color = AppColors.paragraphColor}){
    return TextStyle(
      color:  color,
      fontSize: Dimens.p2Size,
      fontWeight: FontWeight.w400,
    );
  }


  TextStyle customTextStyle({Color color = AppColors.paragraphColor, double fontSize = Dimens.p2Size}){
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }


  ButtonStyle circleBtnStyle(){
    return ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      backgroundColor: AppColors.primaryColor ,
    );
  }
  ButtonStyle circleIconBtnStyle(){
    return IconButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      backgroundColor: AppColors.primaryColor ,
    );
  }

}