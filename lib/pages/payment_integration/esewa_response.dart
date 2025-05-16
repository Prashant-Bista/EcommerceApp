class EsewaPaymentSuccessResponse {
  List<EachResponseForVerify>? data;
  EsewaPaymentSuccessResponse({this.data});
  factory EsewaPaymentSuccessResponse.fromJson(List<Map<String,dynamic>> result){
  return EsewaPaymentSuccessResponse(
  data: result.map((eachresult)=>EachResponseForVerify.fromJson(eachresult)).toList());
  }
}
class EachResponseForVerify{
  String? productId;
  String? productName;
  String? totalAmount;
  String? code;
  Map<String, String>? message;
  Map<String, String>? transactionDetails;
  EachResponseForVerify({this.productId,this.productName,this.totalAmount,this.code,this.message,this.transactionDetails});
  factory EachResponseForVerify.fromJson(Map<String,dynamic> json){
    return EachResponseForVerify(
      productId:json["productId"],
      productName :json["productName"],
      totalAmount :json["totalAmount"],
      code:json["code"],
      message :json["message"],
      transactionDetails:json["transactionDetails"],
    );

  }
}
