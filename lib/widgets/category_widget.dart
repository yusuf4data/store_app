import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/models/category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: category.image.toString(),
            height: size.height * .2,
            width: size.width * .4,
            boxFit: BoxFit.fill,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
          ),
        ),
        //Center(child: Text('yuyu')),
        Align(
          alignment: Alignment.center,
          child: Text(
            category.name.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
