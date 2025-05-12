import 'package:ecommerce_app/pages/cart_page/shopping_cart.dart';
import 'package:ecommerce_app/pages/home_page/home_page_view.dart';
import 'package:flutter/material.dart' show Widget;

class MainPageModel{
  int currentPageIndex;
  List<Widget>? screens=[HomePageView(),ShoppingCart()];
  MainPageModel({required this.currentPageIndex,this.screens});
  factory MainPageModel.initial(){
    return MainPageModel(currentPageIndex: 0, screens: [HomePageView(),ShoppingCart()]);
  }
  MainPageModel copyWith({required int index}){
    return MainPageModel(currentPageIndex: index,screens: [HomePageView(),ShoppingCart()]);
  }
}