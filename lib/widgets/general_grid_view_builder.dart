import 'package:flutter/material.dart';

import 'package:store_app/widgets/custom_widget.dart';

// ignore: must_be_immutable
class GeneralGridViewBuilder<T> extends StatelessWidget {
  List<T> allData;
  GeneralGridViewBuilder({
    Key? key,
    required this.allData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: allData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: .5,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return CustomWidget<T>(data:allData[index] ,);
      },
    );
  }
}
