import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

import 'package:store_app/constants/global_colors.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/product_details.dart';

class FeedsWidget extends StatelessWidget {
  ProductsModel productsModel;
  FeedsWidget({
    Key? key,
    required this.productsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ProductDetails(
              productsModel: productsModel,
            ),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: '\$',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                            children: [
                              TextSpan(
                                text: '${productsModel.price}',
                                style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Icon(IconlyBold.heart)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.images!.first,
                    height: size.height * .22,
                    width: double.infinity,
                    boxFit: BoxFit.fill,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '${productsModel.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
