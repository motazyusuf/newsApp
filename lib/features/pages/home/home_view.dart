import 'package:flutter/material.dart';
import 'package:news_app/features/pages/home/widgets/category_item.dart';
import 'package:news_app/features/pages/home/widgets/customed_drawer.dart';

import '../../../models/category.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final List<Category> categoriesList = [
      Category(
          categoryID: "sports",
          categoryName: "Sports",
          categoryBackgroundColor: const Color(0xFFC91C22),
          categoryImagePath: "assets/images/ball@3x.png"),
      Category(
          categoryID: "politics",
          categoryName: "Politics",
          categoryBackgroundColor: const Color(0xFF003E90),
          categoryImagePath: "assets/images/Politics@3x.png"),
      Category(
          categoryID: "health",
          categoryName: "Health",
          categoryBackgroundColor: const Color(0xFFED1E79),
          categoryImagePath: "assets/images/health@3x.png"),
      Category(
          categoryID: "business",
          categoryName: "Business",
          categoryBackgroundColor: const Color(0xFFCF7E48),
          categoryImagePath: "assets/images/bussines@3x.png"),
      Category(
          categoryID: "environment",
          categoryName: "Environment",
          categoryBackgroundColor: const Color(0xFF4882CF),
          categoryImagePath: "assets/images/environment@3x.png"),
      Category(
          categoryID: "science",
          categoryName: "Science",
          categoryBackgroundColor: const Color(0xFFF2D352),
          categoryImagePath: "assets/images/science@3x.png")
    ];
    var theme = Theme.of(context);
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
        drawer: const CustomedDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pick you category \n of Interest",
                  style: theme.textTheme.headlineLarge
                      ?.copyWith(color: Colors.black)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: categoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.85,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        category: categoriesList[index],
                        index: index,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
