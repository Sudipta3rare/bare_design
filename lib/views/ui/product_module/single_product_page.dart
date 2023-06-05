import 'package:bare_design/views/components/applicaiton_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/appColors.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar(
        title: "Product Page",
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.secondaryColor,
          onPressed: (){
            Get.back();
          },
        ),
      ),
    );
  }
}
