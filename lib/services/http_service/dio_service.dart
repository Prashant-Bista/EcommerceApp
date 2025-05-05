import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/services/exceptionService/exceptionService.dart';

class DioService {
  DioService._privateCostructor();
  static final DioService _instance =   DioService._privateCostructor();
  final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        connectTimeout: Duration(seconds: 10),
        sendTimeout: Duration(seconds: 10),
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {},
        onResponse: (options, handler) {},
      ),
    );
  Future<void> fetchProducts() async{
    late Response response;
    List<dynamic> products=[];
    ExceptionService.handleException(
      tryFunc: () async {
        response = await dio.get("products");
        if (response.statusCode == 200) {
        products= jsonDecode(response.data);
        }
      },
      finallyFunc: () {

      },
    );
  }
}
 DioService get dioService => DioService._instance;


