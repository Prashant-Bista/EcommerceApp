import 'package:ecommerce_app/pages/cart_page/cart_controller.dart';
import 'package:ecommerce_app/pages/cart_page/cart_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/custom_app_bar.dart';


class ShoppingCart extends ConsumerWidget {

   ShoppingCart({super.key});
   late double deviceHeight;
   double totalAmount=0.0;
   late double deviceWidth;
   late Size size;
  final cartControllerProvider = StateNotifierProvider<CartController,CartModel>((ref){
   return CartController();
  });
  late CartModel cartData;
  late CartController cartController;
  @override
  Widget build(BuildContext context,ref) {
    cartController = ref.watch(cartControllerProvider.notifier);
    cartData = ref.watch(cartControllerProvider);
    size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
    return Scaffold(
      appBar: CustomAppBar(title: "Shopping Cart"),
      body: cartData.cartItems!.isNotEmpty?Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartData.cartItems!.length,
                itemBuilder: (context, index) {
                  totalAmount =0.0;
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
                                flex: 1,
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
                                          Text('Qty: ${ item.quantity}'),
                                          IconButton(
                                              onPressed: () {
                                                cartController.updateQuantity(index, cartData.cartItems![index].quantity!+1);
                                              },
                                              icon: const Icon(Icons.add)),
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
                ),
          ),
          Card(color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Total amount: ${totalAmount}",),
                MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                  color:Colors.deepPurple,onPressed: (){},child: Text("CheckOut",style: TextStyle(color: Colors.white),),)
              ],
            ),
          )

        ],
      ):Center(child: CircularProgressIndicator()),
    );
  }
}

