import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page_model.dart';

class HomeController extends StateNotifier<HomePageModel>{
  List<String> categories = ["all","men's clothing","women's clothing","electronics","jewelery"];
  List<ProductModel>? allProducts = [];

  HomeController({HomePageModel? state}):super(state??HomePageModel.initial()) {
    getAllProducts();
  }
  setCategory(int index){
    if(index == 0){
      getAllProducts();
      state= state.copyWith( products: state.products!, currentCategory: categories[0]);
  }
    else{
      List<ProductModel> filteredProducts =  allProducts!.where((product)=>product.category == categories[index]).toList();
      state= state.copyWith( products: filteredProducts, currentCategory: categories[index]);
    }
    print(state.products!.length);
  }
  getAllProducts() async{
    allProducts=  await dioService.fetchProducts();
    state  = state.copyWith( products: allProducts!, currentCategory: state.selectedCategory!);
    print(state.products);
  }

}