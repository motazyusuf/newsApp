import 'package:flutter/material.dart';
import 'package:news_app/features/pages/home/widgets/customed_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context)!;
    var height = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: theme.iconTheme,
          title: Text(
            "News App",
            style: theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomedDrawer(),
      ),
    );
  }
}
