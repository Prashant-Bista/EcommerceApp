import 'package:ecommerce_app/common/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page_controller.dart';
import 'home_page_model.dart';

class HomePageView extends ConsumerWidget {
  HomePageView({super.key});
  late HomeController homeController;
  late HomePageModel homeData;
  final homePageDataController =
      StateNotifierProvider<HomeController, HomePageModel>(
        (ref) => HomeController(),
      );

  @override
  Widget build(BuildContext context, ref) {

    homeController = ref.watch(homePageDataController.notifier);
    homeData = ref.watch(homePageDataController);
    // homeController.getAllProducts();

    return Scaffold(
      body: Column(
        children: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.add))
        ],
      ),
      appBar: CustomAppBar(title: "HomePage", toolBarHeight: 40),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeData.selectedIndex,
        onTap: (index){
          homeController.setCurrentIndex(index);
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
    );
  }
}
