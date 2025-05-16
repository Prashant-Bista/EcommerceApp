import 'package:ecommerce_app/services/route_service/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouteController{
  StatefulNavigationShell? sns;
  BuildContext? ctx;
  setStatefulNavigationShell({required StatefulNavigationShell sns}){
    this.sns = sns;
  }
  setContext({required BuildContext context}){
    ctx = context;
  }
routeToSplashPage({bool shouldRemovePrevious=false, Map<String,dynamic>? extra}){
    if(ctx!=null){
      if(shouldRemovePrevious) {
        ctx?.goNamed(RouteConstants.splash);
      }
      else
        {
          ctx?.pushNamed(RouteConstants.splash);

        }
    }
}
  routeToHomePage({bool shouldRemovePrevious=false, }){
    if(ctx!=null){
      if(shouldRemovePrevious) {
        ctx?.goNamed(RouteConstants.homePage);
      }
      else
      {
        ctx?.pushNamed(RouteConstants.homePage);

      }
    }
  }
  routeToProducts({bool shouldRemovePrevious=false,Map<String,dynamic>? extra}){
    if(ctx!=null){
      if(shouldRemovePrevious){
        ctx?.goNamed(RouteConstants.productDetail,extra: extra);
  }
      else{
        ctx?.pushNamed(RouteConstants.productDetail,extra: extra);
  }
  }
  }
  routeToMainScreen({bool shouldRemovePrevious=false,}){
    if(ctx!=null){
      if(shouldRemovePrevious){
        ctx?.goNamed(RouteConstants.mainScreen,);
      }
      else{
        ctx?.pushNamed(RouteConstants.mainScreen,);
      }
    }

  }

  routeToUserListView({bool shouldRemovePrevious=false,}){
    if(ctx!=null){
      if(shouldRemovePrevious){
        ctx?.goNamed(RouteConstants.userListView,);
      }
      else{
        ctx?.pushNamed(RouteConstants.userListView,);
      }
    }
  }
  routeToUserProfile({bool shouldRemovePrevious=false,Map<String,dynamic>? extra}){
    if(ctx!=null){
      if(shouldRemovePrevious){
        ctx?.goNamed(RouteConstants.userProfile,extra: extra);
      }
      else{
        ctx?.pushNamed(RouteConstants.userProfile,extra: extra);
      }
    }
  }





}