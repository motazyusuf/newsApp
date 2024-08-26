import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_routes_names.dart';
import '../../features/pages/home/home_view.dart';
import '../../features/splash/splash_view.dart';

class AppRouter{

  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case PagesRoutesNames.initial:
      return MaterialPageRoute(builder: (context) => SplashView(), settings: settings);
      case PagesRoutesNames.homeView:
        return MaterialPageRoute(builder: (context) => HomeView(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => SplashView(), settings: settings);
    }
  }

}