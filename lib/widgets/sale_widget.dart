import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 131, 88, 133),
          Color.fromARGB(255, 106, 146, 226),
        ], begin: FractionalOffset(0, 0), end: FractionalOffset(1, 0)),
      ),
    );
  }
}
