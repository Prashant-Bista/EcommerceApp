import 'package:ecommerce_app/common/model/product_model.dart';

import '../../common/enums/categories.dart';

class HomePageModel {
  int selectedIndex;
List<ProductModel>? products;
Categories? selectedCategory;
  HomePageModel({this.selectedIndex = 0,this.products,this.selectedCategory});

  factory HomePageModel.initial(){
    return HomePageModel(
        selectedIndex: 0,
      products: [],
      selectedCategory: Categories.all
    );
  }

   HomePageModel copyWith({required int selectedIndex,required List<ProductModel> products,required Categories currentCategory}){
    return HomePageModel(
      selectedIndex: selectedIndex ,
      products: products,
      selectedCategory: currentCategory,
    );
  }
}