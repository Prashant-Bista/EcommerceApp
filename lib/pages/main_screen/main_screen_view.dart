import 'package:ecommerce_app/pages/main_screen/main_controller.dart';
import 'package:ecommerce_app/pages/main_screen/main_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late final heightWidthProvider;
class MainScreenView extends ConsumerWidget {
  MainScreenView({super.key});
  late double deviceHeight;
  late double deviceWidth;
  late Size size;
  late MainPageModel mainData;
  late MainController mainPageController;
  final mainPageProvider =   StateNotifierProvider<MainController, MainPageModel>(
        (ref) {
      return MainController();
    },
  );
  @override
  Widget build(BuildContext context,ref) {
    mainData = ref.watch(mainPageProvider);
    mainPageController = ref.watch(mainPageProvider.notifier);
    size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
    return  Column(
      children: [
        Expanded(
          child:  mainData.screens![mainData.currentPageIndex],
        ),
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
