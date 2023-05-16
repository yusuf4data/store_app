import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:store_app/constants/global_colors.dart';
import 'package:store_app/models/user_model.dart';

class UsersWidget extends StatelessWidget {
  UserModel userModel;
  UsersWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: FancyShimmerImage(
        imageUrl: userModel.avatar.toString(),
        height: size.width * .15,
        width: size.width * .15,
        boxFit: BoxFit.fill,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
      ),
      title: Text(userModel.name.toString()),
      subtitle: Text(userModel.email.toString()),
      trailing: Text(
        userModel.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
