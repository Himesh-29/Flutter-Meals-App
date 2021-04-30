import 'package:flutter/material.dart';

import '../models/MealOfFoodCategory.dart';
import '../widgets/mealItem.dart';

class FavouritesScreen extends StatefulWidget {
  final List<MealOfFoodCategory> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - start adding some!',
          style: TextStyle(
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
              fontSize: 28),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            category: widget.favouriteMeals[index].category,
            imageURL: widget.favouriteMeals[index].imageURL,
            duration: widget.favouriteMeals[index].duration,
            complexity: widget.favouriteMeals[index].complexity,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
