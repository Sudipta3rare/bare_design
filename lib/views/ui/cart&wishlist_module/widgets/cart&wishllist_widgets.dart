import 'package:bare_design/models/product_list_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/appColors.dart';

class CartTile{
  //To show the image of the product
  Widget tileImage(BuildContext context, ProductListModel product){
    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(0,8,8,8),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            product.productImage,
            // width: 100,
            // height: 100,
          ),),
        borderRadius: BorderRadius.circular(10),
        // color: ColorExtension.randomColor,
        color: AppColors.buttonColor,

      ),
      child: SizedBox(height: 100,
        width: 100,),
    );
  }

  Widget tileProductInfo(BuildContext context, ProductListModel product, controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.productName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          controller.getCurrentSize(),
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "\$ ${product.productPrice}",
          // controller.isPriceOff(product)
          //     ? "\$${product.off}"
          //     : "\$${product.price}",
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 23,
          ),
        ),
      ],
    );
  }
}