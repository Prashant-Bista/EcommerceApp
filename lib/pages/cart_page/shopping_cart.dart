import 'package:ecommerce_app/pages/cart_page/cart_controller.dart';
import 'package:ecommerce_app/pages/cart_page/cart_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/custom_app_bar.dart';


class ShoppingCart extends ConsumerWidget {
   ShoppingCart({super.key});
  final cartControllerProvider = StateNotifierProvider<CartController,CartModel>((ref){
   return CartController();
  });
  late CartModel cartData;
  late CartController cartController;
  @override
  Widget build(BuildContext context,ref) {
    cartController = ref.watch(cartControllerProvider.notifier);
    cartData = ref.watch(cartControllerProvider);
    return SizedBox(
      height: 705,
      child: Scaffold(
        appBar: CustomAppBar(title: "Shopping Cart"),
        body: cartData.cartItems!.isNotEmpty?ListView.builder(
            itemCount: cartData.cartItems!.length,
            itemBuilder: (context, index) {
              print("index $index");
              final item = cartData.cartItems![index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        item.product!.image!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product!.title!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                item.product!.price!.toString(),
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartController.updateQuantity(index, cartData.cartItems![index].quantity!-1);
                                      },
                                      icon: const Icon(Icons.remove)),
                                  Text('Quantity: ${ item.quantity}'),
                                  IconButton(
                                      onPressed: () {
                                        cartController.updateQuantity(index, cartData.cartItems![index].quantity!+1);
                                      },
                                      icon: const Icon(Icons.add)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cartController.deleteQuantity(index);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
            ):Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

