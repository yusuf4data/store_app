import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final VoidCallback function;
  final IconData icon;
 const AppBarIcons({
    Key? key,
    required this.function,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).cardColor),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
