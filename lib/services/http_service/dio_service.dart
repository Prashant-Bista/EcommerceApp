
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/model/product_model.dart';

class DioService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      sendTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
    )
    );
  Future<List<ProductModel>?> fetchProducts() async{
    List<ProductModel> products=[];
    print("entered Fetch Products");
     final response = await dio.get("products",);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> result = response.data;
      result.forEach((json){
        products.add(ProductModel.fromJson(json));
      } );
      return products;
    }
    else{
      print("dio error");
    }
    return null;
  }
}
 DioService get dioService => DioService();


