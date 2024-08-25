import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color_palette.dart';

class CustomedDrawer extends StatelessWidget {
  const CustomedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var theme = Theme.of(context);
    return Container(
      color: Colors.white,
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            width: double.infinity,
            color: ColorPalette.primaryColor,
            child: Center(child: Text("News App!", style: theme.textTheme.headlineLarge,)),
          )
        ],
      ),
    );
  }
}
