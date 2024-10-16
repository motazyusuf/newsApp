import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color_palette.dart';
import 'package:news_app/models/sources_model.dart';

class TabBarItem extends StatelessWidget {
   TabBarItem({super.key, required this.source, required this.isSelected});

  final SingleSource source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected? ColorPalette.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: ColorPalette.primaryColor)
      ),
      child: Text(source.name,
          style: isSelected
              ? theme.textTheme.titleMedium
              : theme.textTheme.titleMedium!
                  .copyWith(color: ColorPalette.primaryColor)),
    );
  }
}
