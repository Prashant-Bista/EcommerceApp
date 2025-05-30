
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';

import '../../pages/user_page/use_model.dart';

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
  Future<ProductModel?> fetchProductById(int id) async{
    ProductModel product;
    print("entered Fetch Products");
    final response = await dio.get("products/$id",);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String,dynamic> result = response.data;
     product = ProductModel.fromJson(result);
     print("product $product");
      return product;
    }
    else{
      print("dio error");
    }
    return null;
  }
  Future<List<UserModel>?> fetchUser() async{
    List<UserModel> users= [];
    Response response  = await dio.get("users");
    if(response.statusCode == 200){
      List<dynamic> result = response.data;
      result.forEach((json){
        users.add(UserModel.fromJson(json));
      } );
      return users;
    }
    return null;
  }
 Future<Response> callVerificationApi(EsewaPaymentSuccessResult result)async {
   Response response = await dio.get(
       "https://rc.esewa.com.np/mobile/transaction?txnRefId=${result.refId}",options: Options(contentType: "application/json",),data: {
         "merchantId":"JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
     "merchantSecret":"BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ=="
   });
   return response;
 }
}
 DioService get dioService => DioService();


