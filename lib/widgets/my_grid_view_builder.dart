import 'package:flutter/material.dart';

import 'package:store_app/models/products_model.dart';
import 'package:store_app/widgets/feeds_widget.dart';

// ignore: must_be_immutable
class MyGridViewBuilder extends StatelessWidget {
  List<ProductsModel> allProducts;
  MyGridViewBuilder({
    Key? key,
    required this.allProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: allProducts.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: .6,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return FeedsWidget(
          productsModel: allProducts[index],
        );
      },
    );
  }
}
