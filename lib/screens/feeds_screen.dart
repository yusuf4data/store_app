import 'package:flutter/material.dart';

import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/general_grid_view_builder.dart';

class FeedsScreen extends StatelessWidget {
 final List<ProductsModel> allProducts;
  const FeedsScreen({
    Key? key,
    required this.allProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
      ),
      body: SingleChildScrollView(
          child: GeneralGridViewBuilder<ProductsModel>(
        allData: allProducts,
      )
          // MyGridViewBuilder(

          //   allProducts: allProducts,
          // ),
          ),
    );
  }
}
