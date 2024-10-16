import 'package:flutter/material.dart';
import 'package:news_app/features/pages/home/widgets/category_item.dart';
import 'package:news_app/features/pages/home/widgets/customed_drawer.dart';
import 'package:news_app/features/pages/selected_category/selected_category_view.dart';

import '../../../models/category_model.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

   CategoryObject? selectedCategory;

  onCategoryTap(CategoryObject category){
    setState(() {
      selectedCategory = category;
    });
  }

   onDrawerCategoryTap(){
     setState(() {
       selectedCategory = null;
     });
   }



  @override
  Widget build(BuildContext context) {
    final List<CategoryObject> categoriesList = [
      CategoryObject(
          categoryID: "sports",
          categoryName: "Sports",
          categoryBackgroundColor: const Color(0xFFC91C22),
          categoryImagePath: "assets/images/ball@3x.png"),
      CategoryObject(
          categoryID: "politics",
          categoryName: "Politics",
          categoryBackgroundColor: const Color(0xFF003E90),
          categoryImagePath: "assets/images/Politics@3x.png"),
      CategoryObject(
          categoryID: "health",
          categoryName: "Health",
          categoryBackgroundColor: const Color(0xFFED1E79),
          categoryImagePath: "assets/images/health@3x.png"),
      CategoryObject(
          categoryID: "business",
          categoryName: "Business",
          categoryBackgroundColor: const Color(0xFFCF7E48),
          categoryImagePath: "assets/images/bussines@3x.png"),
      CategoryObject(
          categoryID: "environment",
          categoryName: "Environment",
          categoryBackgroundColor: const Color(0xFF4882CF),
          categoryImagePath: "assets/images/environment@3x.png"),
      CategoryObject(
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
          actions: selectedCategory == null? [] : [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
            )
          ],

          iconTheme: theme.iconTheme,
          title: Text(
            selectedCategory == null ? "News App" : selectedCategory!.categoryName,
            style: theme.textTheme.titleLarge,
          ),
        ),
        drawer:  CustomedDrawer(onDrawerCategoryTap: onDrawerCategoryTap,),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              onCategoryTap: onCategoryTap,
                              selectedCategory: categoriesList[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            : SelectedCategoryView(selectedCategory: selectedCategory!),
      ),
    );
  }
}
