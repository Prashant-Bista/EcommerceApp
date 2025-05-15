import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EsewaController {

  void pay(double amount, String pid,BuildContext context ) async{
    final config = ESewaConfig.dev(amt:amount , pid: pid, su: "", fu: "");
    final result = await Esewa.i.init(context:context , eSewaConfig: config);
    if(result.hasData){
      final response = result.data!;
      showDialog(context: context, builder: (_)=>AlertDialog(
        title: Text("Payment Successful. Ref Id: ${response.refId}"),
        content: Column(
          children: [
            Icon(Icons.check_circle,color: Colors.green,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))
          ],
        ),
      ));
    }
    else{
      final response = result.error!;
      showDialog(context: context, builder: (_)=>AlertDialog(
        title: Text("Payment failed. Ref Id: ${response}"),
        content: Column(
          children: [
            Icon(Icons.sms_failed,color: Colors.red,),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))
          ],
        ),

      ));
    }
  }
}