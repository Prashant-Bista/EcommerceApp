import 'package:dio/dio.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';

class ExceptionService {
  static handleException({required Function() tryFunc, required Function() finallyFunc}){
    try{
      tryFunc();
    }
    on DioException catch (e){
      throw Exception("DioErorr");
    }
    catch(e){
      return Exception("Some error");
    }
    finally{
      finallyFunc();
  }
  }
}