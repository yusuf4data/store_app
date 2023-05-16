import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants/global_colors.dart';
import 'package:store_app/models/products_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductsModel productsModel;
  const ProductDetails({
    Key? key,
    required this.productsModel,
  }) : super(key: key);

  @override
 
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('product details'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.productsModel.category!.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                        widget.productsModel.title!.toString(),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            text: '\$',
                            style: const TextStyle(
                                fontSize: 25, color: Colors.blue),
                            children: [
                              TextSpan(
                                  text: widget.productsModel.price.toString(),
                                  style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ]),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .4,
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return FancyShimmerImage(
                  imageUrl: widget.productsModel.images![index],
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                );
              },
              autoplay: true,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.white,
                  activeColor: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Description'),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  widget.productsModel.description!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ],
      ))),
    );
  }
}
