import 'package:ecommerce_app/common/model/product_model.dart';

class HomePageModel {
List<ProductModel>? products;
String? selectedCategory;
  HomePageModel({this.products,this.selectedCategory});

  factory HomePageModel.initial(){
    return HomePageModel(
      products: [],
      selectedCategory: "all"
    );
  }

   HomePageModel copyWith({required List<ProductModel> products,required String currentCategory}){
    return HomePageModel(
      products: products,
      selectedCategory: currentCategory,
    );
  }
}