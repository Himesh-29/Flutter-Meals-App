import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/FoodCategoryOnMainScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES
            .map((category) => FoodCategoryOnMainScreenCategoryItem(
                category.category, category.bgColor, category.id))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 30,
        )); //Here 3/2 means that for 200 width, I want to have 300 height, and mainAxisSpacing and crossAxisSpacing means how much space we want to have between the items in main axis and cross axis.
  }
}
