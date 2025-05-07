import 'package:ecommerce_app/common/model/product_model.dart';

class HomePageModel {
  int selectedIndex;
List<ProductModel>? products;
  HomePageModel({this.selectedIndex = 0,this.products});

  factory HomePageModel.initial(){
    return HomePageModel(
        selectedIndex: 0,
      products: []
    );
  }

   HomePageModel copyWith({int? selectedIndex,List<ProductModel>? products}){
    return HomePageModel(
      selectedIndex: selectedIndex ?? 0,
      products: products??<ProductModel>[]
    );
  }
}