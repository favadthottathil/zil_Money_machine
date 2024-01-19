import 'dart:convert';

import 'package:zil_money/Model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  final apiEndPoint = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> getProducts() async {
    final url = Uri.parse(apiEndPoint);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      print(data);

       List<ProductModel> products = data.map((item) => ProductModel.formJson(item as Map<String, dynamic>)).toList();

      print(products);

      return products;
    } else {
      return [];
    }
  }
}
