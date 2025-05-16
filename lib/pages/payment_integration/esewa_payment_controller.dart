import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

class EsewaPaymentController{

  Future<void> makePayment({required String produtId, required productName, required productPrice, required BuildContext context}) async{
    VoidCallback action = (){
      Navigator.of(context);
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
          showDialog(context: context, builder: (_)=>messageAlert("Success", Icons.check, action));
          // verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
          showDialog(context: context, builder: (_)=>messageAlert("Failed", Icons.sms_failed, action));


        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
          showDialog(context: context, builder: (_)=>messageAlert("Cancelled", Icons.cancel, action));

        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }


  }
  Widget messageAlert(String type, IconData iconData,VoidCallback onPressed){
    return AlertDialog(
      title: Text(type),
      content: Column(
        children: [
          Icon(iconData),
          ElevatedButton(onPressed: onPressed, child: Text("OK"))
        ],
      ),
    );
  }

}

