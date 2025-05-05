import 'package:ecommerce_app/common/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/home_page/home_page_controller.dart';
import 'package:ecommerce_app/home_page/home_page_model.dart';
import 'package:ecommerce_app/services/http_service/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
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
