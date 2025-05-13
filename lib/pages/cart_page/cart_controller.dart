import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/cart_page/cart_model.dart';
import 'package:ecommerce_app/pages/home_page/home_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/http_service/dio_service.dart';

class CartController extends StateNotifier<CartModel>{
  late var prefs;
  late final homeControllerProvider ;
late HomePageModel homeData ;

  CartController({CartModel? state,}):super(state??CartModel.initial()){
    getAllCartItems();
    setSharedPrefs();
  }
  setSharedPrefs()async{
    prefs = await SharedPreferences.getInstance();
  }
  Future<void> updateQuantity(int index,int newQuantity) async {
    int productId= state.cartItems![index].product!.id!;
    await prefs.setInt('productId_$productId', newQuantity);
    List<EachCartItemModel> items = state.cartItems!;
    items[index].quantity = newQuantity;
    state = state.copyWith(cartItemModels: items);
  }

  Future<void> deleteQuantity(int index) async {
    int productId = state.cartItems![index].product!.id!;
    await prefs.remove('productId_$productId');
    List<EachCartItemModel> items = state.cartItems!;
    items.removeAt(index);
    state= state.copyWith(cartItemModels: items);
  }

Future<void> getAllCartItems() async{
  ProductModel? product;
  List<EachCartItemModel> cartItems=[];
  int id= -1;
  int? currQty=-1;
  final prefs = await SharedPreferences.getInstance();
 Set<String> keys =  prefs.getKeys();
 print("cart Itemskeys $keys");
  for(String key in keys) {
    id = int.parse(key.replaceAll("productId_", ""));
    product = await dioService.fetchProductById(id);
    print("Controller product $product");
    currQty = prefs.getInt(key);
    print("Controller product qty $currQty");
    cartItems.add(EachCartItemModel(quantity: currQty,product: product));
    print("cartItems length ${cartItems.length}");
 }
 print("CartItems $cartItems");
state =state.copyWith(cartItemModels: cartItems);
print("State ${state.cartItems}");
}
}


