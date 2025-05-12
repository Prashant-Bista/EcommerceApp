import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/cart_page/cart_model.dart';
import 'package:ecommerce_app/pages/home_page/home_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/http_service/dio_service.dart';

class CartController extends StateNotifier<CartModel>{
late final homeControllerProvider ;
late HomePageModel homeData ;
   List<ProductModel>? products=[];
 List<EachCartItemModel> cartItems=[];
late List<int> qtys;
  CartController({CartModel? state,}):super(state??CartModel.initial()){
    getAllCartItems();
  }
  Future<void> updateQuantity(String productId,int newQuantity) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('productId_$productId', newQuantity);
  }

  Future<void> deleteQuantity(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('productId_$productId');
  }

Future<void> getAllCartItems() async{
  final prefs = await SharedPreferences.getInstance();
  products=  await dioService.fetchProducts();
  print(products);
 Set<String> keys =  prefs.getKeys();
 int? currQty=-1;
 products?.forEach((product){
   if(keys.contains("productId_${product.id}")){
     currQty =  prefs.getInt("productId_${product.id}")!;
     cartItems.add(EachCartItemModel(quantity: currQty,product: product));
   }
 });
 state= state.copyWith(cartItemModels: cartItems,);
}
}


