import 'package:flutter/material.dart';
import 'package:news_app/features/pages/selected_category/widgets/tabBar_item.dart';
import 'package:news_app/models/sources_model.dart';

class SelectedCategoryDetails extends StatefulWidget {
   SelectedCategoryDetails({super.key, required this.singleSourceList});
    List <SingleSource> singleSourceList;

    @override
  State<SelectedCategoryDetails> createState() => _SelectedCategoryDetailsState();
}

class _SelectedCategoryDetailsState extends State<SelectedCategoryDetails> {
  int selectedIndex=0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.singleSourceList.length,
            child: TabBar(onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(vertical: 8),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: widget.singleSourceList
                    .map((source) => TabBarItem(
                  source: source,
                  isSelected: selectedIndex ==
                      widget.singleSourceList.indexOf(source)
                      ? true
                      : false,
                ))
                    .toList()))
      ],
    );;
  }
}
