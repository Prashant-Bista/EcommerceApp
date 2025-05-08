import 'package:ecommerce_app/common/model/product_model.dart';

class ProductDetailModel {
  int? quantity;
  ProductModel? product;
  bool? addedToCart;
  ProductDetailModel({this.quantity, this.product, this.addedToCart});

  factory ProductDetailModel.initial() {
    return ProductDetailModel(
      quantity: 1,
      product: ProductModel.initial(),
      addedToCart: false,
    );
  }
  ProductDetailModel copyWith({
    int? qty,
    ProductModel? product,
    bool? isCartAdded,
  }) {
    return ProductDetailModel(
      quantity: qty?? 1,
      product: product??ProductModel.initial(),
      addedToCart: isCartAdded??false,
    );
  }
}
