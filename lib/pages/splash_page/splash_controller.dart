
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../services/route_service/routes.dart';

class SplashController{
  late TickerProvider tickerProvider;
  late AnimationController splashAnimationController ;
  late Animation<Offset> tween1;
  late Animation<Offset> tween2;

  late GetIt getIt;
  SplashController({required this.tickerProvider}){
    getIt = GetIt.instance;
    splashAnimationController = AnimationController(vsync: tickerProvider,duration: Duration(seconds: 2,),)..forward().then((value)=>routeController.routeToMainScreen());
    tween1 = Tween<Offset>(begin: Offset(-200, 0),end: Offset(0, 0)).animate(splashAnimationController);
    tween2 = Tween<Offset>(begin:Offset(200, 0) ,end: Offset(0, 0)).animate(splashAnimationController);
  setup();
  }
  setup(){
  }

}