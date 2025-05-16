
import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/payment_integration/esewa_payment_controller.dart';
import 'package:ecommerce_app/pages/product_details/product_detail_controller.dart';
import 'package:ecommerce_app/pages/product_details/product_detail_model.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/widgets/custom_app_bar.dart';


class ProductDetailsView extends ConsumerWidget {
  final ProductModel product;
  ProductDetailsView({super.key, required this.product});
  late  final productDetailControllerProvider=StateNotifierProvider<ProductDetailController,ProductDetailModel>((ref){
    return ProductDetailController(state: ProductDetailModel(quantity: 1,product: product,addedToCart: false));
  });
  late ProductDetailController productDetailController;
  late ProductDetailModel productDetailData;
  EsewaPaymentController esewaController =EsewaPaymentController();
  @override
  Widget build(BuildContext context,ref) {
    productDetailController = ref.watch(productDetailControllerProvider.notifier);
    productDetailData  = ref.watch(productDetailControllerProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: productDetailData.product!.title!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                productDetailData.product!.image!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "\$${productDetailData.product!.price!.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "\$${productDetailData.product!.rating?.rate.toString()}",
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "\$${productDetailData.product!.rating?.count.toString()} reviews",
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                productDetailData.product!.description!,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        productDetailController.decreaseQty();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.deepPurple),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    productDetailData.quantity.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        productDetailController.increaseQty();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.deepPurple),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () async{
esewaController.makePayment(produtId: productDetailData.product!.id.toString(), productName: productDetailData.product!.title, productPrice: (productDetailData.product!.price! *productDetailData.quantity!.toDouble()).toString(), context: context);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.deepPurple),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          productDetailController.addRemoveFromCardTocart(context);                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.deepPurple),
                        child:  Text("${productDetailData.addedToCart!?"Remove":"Add"} to Cart",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

