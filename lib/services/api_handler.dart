import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/constants/api_constant.dart';
import 'package:store_app/models/category.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/services/repository.dart';

class APIHandler<T> implements Repository {
  @override
  Future<List<T>> getAllData(String type) async {
    // Map<String, dynamic> quaryParameter = {};
    // if (type == 'products') {
    //   quaryParameter = {'offset': '0', 'limit': '10'};
    // }
    Uri uri = Uri.https(Base_URL, '/api/v1/$type');

    var response = await http.get(uri);
    var data = jsonDecode(response.body);
    List<T> allData = [];

    if (T == ProductsModel) {
      List<ProductsModel> allProducts = [];
      for (var element in data) {
        allProducts.add(ProductsModel.fromJson(element));
        allData = allProducts as List<T>;
      }
    }
    if (T == Category) {
      List<Category> allCategories = [];
      for (var element in data) {
        allCategories.add(Category.fromJson(element));
        allData = allCategories as List<T>;
      }
    }
    if (T == UserModel) {
      List<UserModel> allUsers = [];
      for (var element in data) {
        allUsers.add(UserModel.fromJson(element));
        allData = allUsers as List<T>;
      }
    }

    return allData;
  }

  // Future<List<ProductsModel>> getAllProducts() async {
  //   Uri uri = Uri.https(Base_URL, '/api/v1/products');

  //   var response = await http.get(uri);

  //   List<ProductsModel> allProducts = [];
  //   var data = jsonDecode(response.body);
  //   for (var element in data) {
  //     allProducts.add(ProductsModel.fromJson(element));
  //   }
  //   return allProducts;
  // }

  // Future<List<Category>> getAllCategories() async {
  //   //'https://api.escuelajs.co/api/v1/categories'
  //   Uri uri = Uri.https(Base_URL, '/api/v1/categories');

  //   var response = await http.get(uri);

  //   List<Category> allCategories = [];
  //   var data = jsonDecode(response.body);
  //   for (var category in data) {
  //     allCategories.add(Category.fromJson(category));
  //   }
  //   return allCategories;
  // }
}
