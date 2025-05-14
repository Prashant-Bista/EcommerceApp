import 'package:ecommerce_app/common/model/product_model.dart';
import 'package:ecommerce_app/pages/main_screen/main_screen_view.dart';
import 'package:ecommerce_app/pages/product_details/product_details_view.dart';
import 'package:ecommerce_app/pages/user_page/users_list_view.dart';
import 'package:ecommerce_app/services/route_service/route_constants.dart';
import 'package:ecommerce_app/services/route_service/route_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../pages/home_page/home_page_view.dart';
import '../../pages/splash_page/splash_view.dart';


RouteController routeController = RouteController();
final _routeNavigationKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  navigatorKey: _routeNavigationKey,
  initialLocation: RouteConstants.splash,
  routes: [
    GoRoute(
      path: RouteConstants.splash,
      name: RouteConstants.splash,
      builder: (context, state) {
        routeController.setContext(context: context);
        return SplashView(key: state.pageKey);
      },
        routes: [
          GoRoute(
            path: RouteConstants.mainScreen,
            name: RouteConstants.mainScreen,
            builder: (context, state) {
              routeController.setContext(context: context);
              return MainScreenView(key: state.pageKey);
            },
          ),
          GoRoute(
            path: RouteConstants.homePage,
            name: RouteConstants.homePage,
            builder: (context, state) {
              routeController.setContext(context: context);
              return HomePageView(key: state.pageKey);
            },
          ),
          GoRoute(path: RouteConstants.productDetail,name: RouteConstants.productDetail,builder: (context,state){
            routeController.setContext(context: context);
            Map<String, dynamic>? extra = state.extra as Map<String,dynamic>;
            return ProductDetailsView(product: extra.isNotEmpty?extra["product"]:ProductModel.initial());
          }),
          GoRoute(path: RouteConstants.userListView,name: RouteConstants.userListView,builder: (context,state){
            routeController.setContext(context: context);
            return UsersListView();
          }),
          GoRoute(path: RouteConstants.userProfile,name: RouteConstants.userProfile,builder: (context,state){
            routeController.setContext(context: context);
            Map<String, dynamic>? extra = state.extra as Map<String,dynamic>;
            return ProductDetailsView(product: extra.isNotEmpty?extra["product"]:ProductModel.initial());
          }),
        ]
    ),

  ],
);
