import 'package:ecommerce_app/pages/home_page/home_page_view.dart';
import 'package:ecommerce_app/pages/main_screen/main_controller.dart';
import 'package:ecommerce_app/pages/main_screen/main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cart_page/shopping_cart.dart';

class MainScreenView extends ConsumerWidget {
  MainScreenView({super.key});
  late MainPageModel mainData;
  late MainController mainPageController;
  final mainPageProvider =   StateNotifierProvider<MainController, MainPageModel>(
        (ref) {
      return MainController();
    },
  );
  List<Widget> pages = [HomePageView(),ShoppingCart()];
  @override
  Widget build(BuildContext context,ref) {
    mainData = ref.watch(mainPageProvider);
    mainPageController = ref.watch(mainPageProvider.notifier);
    return  Column(
      children: [
        mainData.screens![mainData.currentPageIndex],
        BottomNavigationBar(
          currentIndex: mainData.currentPageIndex,
          onTap: (index){
            mainPageController.setCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Users List",
            ),
          ],
        ),
      ],
    );

  }
}
