import 'package:ecommerce_app/home_page/home_page_model.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomePageModel>{
  HomeController({HomePageModel? state}):super(state??HomePageModel.initial());
setCurrentIndex(int index){
   state  = state.copyWith(selectedIndex: index);
}
getAllProducts() async{
  // List<dynamic>  products= await dioService.fetchProducts();
}
}