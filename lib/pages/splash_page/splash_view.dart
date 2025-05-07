import 'package:ecommerce_app/pages/splash_page/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
   SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin{
   late SplashController splashController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashController= SplashController(tickerProvider: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    splashController.splashAnimationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: AnimatedBuilder(animation: splashController.splashAnimationController, builder: (context,child){
                return Transform.translate(offset:splashController.tween1.value,child: child,);
              },child: SvgPicture.asset("assets/add-to-cart.svg",height: 200,width: 200,),),
            ),
            AnimatedBuilder(animation: splashController.splashAnimationController, builder: (context,child){
              return Transform.translate(offset:splashController.tween2.value,child: child,);
            },child: Text("E-Commerce App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),))
          ],
        ),
      ),
    );
  }
}
