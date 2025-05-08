import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/custom_app_bar.dart';


class ProductDetailsView extends StatelessWidget {
  final ProductModel product;
  ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Scaffold(
      appBar: CustomAppBar(
        title: product.title!,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image!,
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "\$${product.price!.toStringAsFixed(2)}",
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
                    "\$${product.rating?.rate.toString()}",
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "\$${product.rating?.count.toString()} reviews",
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                product.description!,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                      //decrease quantity
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
                    quantity.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //increase qty
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
                        onPressed: () {},
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
                          // addToCart();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.deepPurple),
                        child: const Text(
                          "Add to Cart",
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

