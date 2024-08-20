import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/config/pages_routes_names.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, PagesRoutesNames.homeView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset("assets/images/logo.png"),
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
    );
  }
}
