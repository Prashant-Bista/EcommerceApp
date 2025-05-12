import 'package:ecommerce_app/common/model/product_model.dart';

class CartModel{
  List<EachCartItemModel>? cartItems;
  CartModel({this.cartItems});
  factory CartModel.initial(){
    return CartModel(
      cartItems:[]
    );
  }
  CartModel copyWith({List<EachCartItemModel>? cartItemModels}){
    return CartModel(
        cartItems:cartItemModels??[]
    );
  }
}
class EachCartItemModel {
  int? quantity;
  ProductModel? product;
  EachCartItemModel({this.quantity, this.product});

  factory EachCartItemModel.initial() {
    return EachCartItemModel(
      quantity: 1,
      product: ProductModel.initial(),
    );
  }
  EachCartItemModel copyWith({
    int? qty,
    ProductModel? product,
  }) {
    return EachCartItemModel(
      quantity: qty?? 1,
      product: product??ProductModel.initial(),
    );
  }
}
