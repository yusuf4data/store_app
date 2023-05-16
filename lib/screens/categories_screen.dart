import 'package:flutter/material.dart';

import 'package:store_app/models/category.dart';
import 'package:store_app/services/api_handler.dart';
import 'package:store_app/widgets/general_grid_view_builder.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> allCategories = [];

  Future<List<Category>> getAllCategories() async {
    allCategories = await APIHandler<Category>().getAllData('categories');
    return allCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All categories'),
      ),
      body: FutureBuilder(
        future: getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child:
                    GeneralGridViewBuilder<Category>(allData: snapshot.data!));
            // CategoryWidget(
            //   category: snapshot.data!.first,
            // );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
