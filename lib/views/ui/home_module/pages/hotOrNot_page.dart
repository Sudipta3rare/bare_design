import 'package:bare_design/views/ui/product_list_module/product_list_page.dart';
import 'package:flutter/material.dart';

class HotPage extends StatelessWidget {
  const HotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductListPage().showBody(context);
  }
}
