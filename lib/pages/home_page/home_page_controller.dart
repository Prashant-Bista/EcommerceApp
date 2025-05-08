import 'package:ecommerce_app/common/enums/categories.dart';
import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page_model.dart';

class HomeController extends StateNotifier<HomePageModel>{
  HomeController({HomePageModel? state}):super(state??HomePageModel.initial()){
    getAllProducts();
  }
setCurrentIndex(int index){
   state  = state.copyWith(selectedIndex: index, products: state.products!, currentCategory: state.selectedCategory!);
}
setCategory(int index){
    state = state.copyWith(selectedIndex: state.selectedIndex, products: state.products!, currentCategory: Categories.values[index]);
}
getAllProducts() async{
  List<ProductModel>? products=  await dioService.fetchProducts();
  state  = state.copyWith(selectedIndex: state.selectedIndex, products: products!, currentCategory: state.selectedCategory!);
  print(state.products);
}
}