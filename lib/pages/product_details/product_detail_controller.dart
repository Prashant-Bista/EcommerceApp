import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/product_details/product_detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailController extends StateNotifier<ProductDetailModel>{
  ProductDetailController({required ProductDetailModel state}):super(state);
  selectProductForDetailView(ProductModel product){
    state = state.copyWith(qty: state.quantity,product:product,isCartAdded: state.addedToCart);
  }
  increaseQty(){
    state = state.copyWith(qty: state.quantity!+1,product:state.product,isCartAdded: state.addedToCart);
  }
  decreaseQty(){
    state = state.copyWith(qty: state.quantity!-1,product:state.product,isCartAdded: state.addedToCart);
  }
  addRemoveFromCardTocart(){
    if(state.addedToCart==true){
      state = state.copyWith(qty: state.quantity,product:state.product,isCartAdded: false);
    }
    else{
      state = state.copyWith(qty: state.quantity,product:state.product,isCartAdded: true);
    }

  }
}