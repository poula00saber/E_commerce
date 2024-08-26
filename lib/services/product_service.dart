import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductServices {
  Dio dio = Dio();

  Future<List<Product>> getData({required String path}) async {
    Response response = await dio.get(path);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> products = jsonData["products"];
    List<Product> productList = [];
    for (var product in products) {
      productList.add(Product.fromJson(product));
    }
    return productList;
  }
}
