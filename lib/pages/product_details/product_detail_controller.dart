import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/product_details/product_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailController extends StateNotifier<ProductDetailModel> {
  ProductDetailController({required ProductDetailModel state}) : super(state){
    selectProductForDetailView(state.product!);
  }
  selectProductForDetailView(ProductModel product) async {
    final prefs = await SharedPreferences.getInstance();
    Set<String> keys =prefs.getKeys();
    print("keys $keys");
    if(keys.contains("productId_${product.id}")){
      state = state.copyWith(
        qty: prefs.getInt("productId_${product.id}"),
        product: product,
        isCartAdded: true,
      );
    }
    else{
      state = state.copyWith(
        qty: state.quantity,
        product: product,
        isCartAdded: state.addedToCart,
      );
    }
    

  }

  increaseQty() {
    state = state.copyWith(
      qty: state.quantity! + 1,
      product: state.product,
      isCartAdded: state.addedToCart,
    );
  }

  decreaseQty() {
    state = state.copyWith(
      qty: state.quantity! - 1,
      product: state.product,
      isCartAdded: state.addedToCart,
    );
  }

  addRemoveFromCardTocart(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (state.addedToCart == false) {
      prefs.setInt("productId_${state.product!.id!}", state.quantity!);
      print("added shared pref");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${state.product!.title} removed to Cart",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 1),
        ),
      );
      state = state.copyWith(
        qty: state.quantity,
        product: state.product,
        isCartAdded: true,
      );
    } else {
      prefs.remove("productId_${state.product!.id!}");
      print("removed shared pref");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${state.product!.title} added to Cart",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          duration: Duration(seconds: 1),
        ),
      );
      state = state.copyWith(
        qty: state.quantity,
        product: state.product,
        isCartAdded: false,
      );
    }
  }
}
