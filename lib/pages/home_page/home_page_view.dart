import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/common/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/product_card.dart';
import 'package:ecommerce_app/services/route_service/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../common/enums/categories.dart';
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
  Widget build(context, ref) {
    homeController = ref.watch(homePageDataController.notifier);
    homeData = ref.watch(homePageDataController);
    Size mQSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(title: "Home Page", toolBarHeight: 50),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Skeletonizer(
              enabled: homeData.products!.isEmpty ? true : false,
              child: SizedBox(
              height: 40,
              child:  ListView.separated(
                separatorBuilder: (context,_){
                  return SizedBox(width: 20,);
                },
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Categories.values.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                        splashColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          homeController.setCategory(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    homeData.selectedCategory ==
                                            Categories.values[index]
                                        ? Colors.deepPurple
                                        : Colors.tealAccent,
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                            color:
                                homeData.selectedCategory ==
                                        Categories.values[index]
                                    ? Colors.deepPurple
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            Categories.values[index].toString().replaceAll(
                              "Categories.",
                              "",
                            ),
                            style: TextStyle(
                              color:
                                  homeData.selectedCategory ==
                                          Categories.values[index]
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 594,
            child: ListView.builder(
              itemCount:
                  homeData.products!.isEmpty ? 10 : homeData.products!.length,
              itemBuilder: (context, index) {
                return homeData.products!.isEmpty
                    ? Skeletonizer(
                      child: ProductCard(product: ProductModel.initial()),
                    )
                    : InkWell(onTap:(){

                      routeController.routeToProducts(extra: {"product":homeData.products![index]});
                },child: ProductCard(product: homeData.products![index]));
              },
            ),
          ),
        ],
      ),
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
