import 'dart:core';
import 'package:flutter/cupertino.dart';

class ProductModel{
  int? id;
  String? title;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;
  double? price;
  ProductModel({this.id,this.title,this.description,this.category,this.image,this.price,this.rating});
  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
    id:json["id"],
      title :json["title"],
      description:json["description"],
        category:json["category"],
      image:json["image"],
      rating :RatingModel.fromJson(json["rating"]),
      price :json["price"].toDouble(),
    );
  }
  factory ProductModel.initial(){
    return ProductModel(
      id:0,
      title: "",
      description: "",
      category: "",
      image: "",
      rating: RatingModel.fromJson({"rate":0.0,"count":0}),
      price: 0.0,
    );
  }
  toJson(){
    return {
      "id" :id ,
      "title" :title ,
      "description" : description,
      "category" : category,
      "image" :image ,
      "rating" : rating!.toJson(),
      "price" : price,
    };
  }

}
class RatingModel{
  double? rate;
  int? count;
  RatingModel({this.rate,this.count});
  factory RatingModel.fromJson(Map<String,dynamic> json){
    return RatingModel(
      rate: json["rate"].toDouble()??0.0,
      count: json["count"]??0
    );
  }
  toJson(){
    return {
      "rate":rate,
      "count": count
    };
  }
}