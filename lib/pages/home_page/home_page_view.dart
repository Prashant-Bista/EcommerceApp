import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/common/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/common/widgets/product_card.dart';
import 'package:ecommerce_app/pages/main_screen/main_screen_view.dart';
import 'package:ecommerce_app/services/route_service/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'home_page_controller.dart';
import 'home_page_model.dart';

class HomePageView extends ConsumerWidget {
  HomePageView({super.key});

  late HomeController homeController;
  late HomePageModel homeData;
  late double deviceHeight;
  late double deviceWidth;
  late Size size;
  final homePageDataController =
  StateNotifierProvider<HomeController, HomePageModel>(
        (ref) {
          ref.keepAlive();
      return HomeController();
    },
  );

  @override
  Widget build(context, ref) {
    homeController = ref.watch(homePageDataController.notifier);
    homeData = ref.watch(homePageDataController);
    size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
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
                  child: ListView.separated(
                    separatorBuilder: (context, _) {
                      return SizedBox(width: 20,);
                    },
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.categories.length,
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
                                      homeController.categories[index]
                                      ? Colors.deepPurple
                                      : Colors.tealAccent,
                                  blurRadius: 10,
                                  blurStyle: BlurStyle.outer,
                                ),
                              ],
                              color:
                              homeData.selectedCategory ==
                                  homeController.categories[index]
                                  ? Colors.deepPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              homeController.categories[index].toString().replaceAll(
                                "Categories.",
                                "",
                              ),
                              style: TextStyle(
                                color:
                                homeData.selectedCategory ==
                                    homeController.categories[index]
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
            Expanded(
              child: ListView.builder(
                itemCount:
                homeData.products!.isEmpty ? 10 : homeData.products!.length,
                itemBuilder: (context, index) {
                  return homeData.products!.isEmpty
                      ? Skeletonizer(
                    child: ProductCard(product: ProductModel.initial()),
                  )
                      : InkWell(onTap: () {
                    routeController.routeToProducts(
                        extra: {"product": homeData.products![index]});
                  }, child: ProductCard(product: homeData.products![index]));
                },
              ),
            ),
          ],
        )
    );
  }
}
