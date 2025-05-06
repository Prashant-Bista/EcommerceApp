import 'package:dio/dio.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter/foundation.dart';

class ExceptionService {

  static handleException({
    required void Function() tryFunc,
    Future<void> Function(Object?)? onDioException,
    Future<void> Function(Object?)? onGeneralException,
    required void Function() finallyFunc,
    bool showAlertMessage=true
  }) {
    try {
      tryFunc();
    } on DioException catch (e) {
      if(e.message!.contains("violates not-null constraint")){
        //BotToast.showText(text: "Something went wrong");
        return;
      }
      if(onDioException!=null){
        onDioException(e);
        return;
      }
      //botToast.showText(text:"${e.message}"
      if (showAlertMessage){
        //BotToast.showText(text:"${e.message}");
        return;
      }
      
    } catch (e) {
      if(onGeneralException!=null){
        onGeneralException(e);
        return;
      }
      if(kDebugMode){
        print("Dio Exception Here $e");
      }
      if (showAlertMessage){
        //BotToast.showText(text:"${e.message}");
        return;
      }
    } finally {
      finallyFunc();
    }
  }
}
