import 'dart:io';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:ecommerce_app/services/route_service/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    if(Platform.isAndroid){
      WebViewPlatform.instance = AndroidWebViewPlatform();
    }
    if(Platform.isIOS || Platform.isMacOS){
      WebViewPlatform.instance = WebKitWebViewPlatform();
    }
  }
  await SharedPreferences.getInstance();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      backButtonDispatcher: router.backButtonDispatcher,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      title: 'Flutter Demo',
    );
  }
}


