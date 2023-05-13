import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/constants/global_colors.dart';

InputDecoration myInputDecoration(BuildContext context) {
  return InputDecoration(
      hintText: 'search',
      fillColor: Theme.of(context).cardColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).cardColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      suffixIcon: Icon(
        IconlyLight.search,
        color: lightIconsColor,
      ));
}
