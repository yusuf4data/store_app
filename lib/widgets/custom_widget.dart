import 'package:flutter/material.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/widgets/category_widget.dart';
import 'package:store_app/widgets/feeds_widget.dart';
import 'package:store_app/widgets/user_widget.dart';

class CustomWidget<T> extends StatelessWidget {
  T data;
  CustomWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (T == ProductsModel) {
      return FeedsWidget(productsModel: data as ProductsModel);
    }
    if (T == Category) {
      return CategoryWidget(category: data as Category);
    }
    if (T == UserModel) {
      return UsersWidget(userModel: data as UserModel);
    }
    return const CircularProgressIndicator();
  }
}
