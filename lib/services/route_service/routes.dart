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
            path: RouteConstants.homePage,
            name: RouteConstants.homePage,
            builder: (context, state) {
              routeController.setContext(context: context);
              return HomePageView(key: state.pageKey);
            },
          ),
        ]
    ),

  ],
);
