import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/config/app_router.dart';
import 'package:news_app/core/config/pages_routes_names.dart';
import 'package:news_app/core/network/api_manager.dart';
import 'package:news_app/core/theme/application_theme_manager.dart';

void main() {
  runApp(const MyApp());

  // ApiManager.fetchArticlesList("sports");
  // ApiManager.fetchSourcesList("sports");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion(value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        initialRoute: PagesRoutesNames.initial,
        theme: ApplicationThemeManager.theme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'News app',
      ),
    );
  }
}


