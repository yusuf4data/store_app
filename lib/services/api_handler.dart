import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/constants/api_constant.dart';
import 'package:store_app/models/products_model.dart';

class APIHandler {
  Future<List<ProductsModel>> getAllProducts() async {
    Uri uri = Uri.https(Base_URL, '/api/v1/products');

    var response = await http.get(uri);

    List<ProductsModel> allProducts = [];
    var data = jsonDecode(response.body);
    for (var element in data) {
      allProducts.add(ProductsModel.fromJson(element));
    }
    return allProducts;
  }

 
}
