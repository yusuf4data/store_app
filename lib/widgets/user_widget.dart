import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/constants/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: FancyShimmerImage(
        imageUrl:
            'https://e7.pngegg.com/pngimages/382/622/png-clipart-sneakers-skate-shoe-nike-one-nike-shoe-purple-fashion-thumbnail.png',
        height: size.height * .15,
        width: size.width * .15,
        boxFit: BoxFit.fill,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
      ),
      title: Text('user name'),
      subtitle: Text('yua@gmail.cmom'),
      trailing: Text(
        'user role',
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
