import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

import 'esewa_response.dart';

class EsewaPaymentController{

  Future<void> makePayment({required String produtId, required productName, required productPrice, required BuildContext context}) async{
    VoidCallback action = (){
      Navigator.of(context).pop();
    };
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
          secretId: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        ),
        esewaPayment: EsewaPayment(
          productId: produtId,
          productName: productName,
          productPrice: productPrice, callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          showDialog(context: context, builder: (_)=>messageAlert("Success", Icon(Icons.check,color: Colors.green,), action));
          // verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
          showDialog(context: context, builder: (_)=>messageAlert("Failed", Icon(Icons.sms_failed,color: Colors.red,), action));

        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
          showDialog(context: context, builder: (_)=>messageAlert("Cancelled", Icon(Icons.cancel,color:Colors.amber), action));

        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }


  }
  Widget messageAlert(String type, Icon icon,VoidCallback onPressed){
    return AlertDialog(
      title: Text(type,textAlign: TextAlign.center,),
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            ElevatedButton(onPressed: onPressed, child: Text("OK"))
          ],
        ),
      ),
    );
  }
  void verifyTransactionStatus(
      {required EsewaPaymentSuccessResult result, Function? onSuccess,Function? onFailure}) async {
    var response = await dioService.callVerificationApi(result);
    if (response.statusCode == 200) {
      final sucResponse = EsewaPaymentSuccessResponse.fromJson(response.data);
      debugPrint("Response Code => ${sucResponse.data}");
      if (sucResponse.data![0].transactionDetails!["status"] == 'COMPLETE') {
        onSuccess;
      }
      //TODO Handle Txn Verification Failure
    } else {
      onFailure;
      //TODO Handle Txn Verification Failure
    }
  }

}

