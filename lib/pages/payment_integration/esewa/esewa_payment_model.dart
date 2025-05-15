class EsewaPaymentSuccessResponse {
  String? productId;
  String? productName;
  String? totalAmount;
  String? environment;
  String? code;
  String? merchantName;
  String? message;
  String? date;
  String? status;
  String? refId;
  EsewaPaymentSuccessResponse({
    this.productId,
    this.productName,
    this.environment,
    this.code,
    this.message,this.status,this.totalAmount,this.date,this.merchantName,this.refId

  });
  factory EsewaPaymentSuccessResponse.fromJson(Map<String,dynamic> json){
    return EsewaPaymentSuccessResponse(
      productId: json["productId"],
      productName: json["productName"],
      totalAmount:json["totalAmount"],
      environment:json["environment"],
      code :json["code"],
      merchantName:json["merchantName"],
      message :json["message"],
      date :json["date"],
      status:json["status"],
      refId :json["refId"],
    );
  }
}
