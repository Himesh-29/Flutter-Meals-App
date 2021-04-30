import 'package:flutter/material.dart';
import 'package:meals_app/models/MealOfFoodCategory.dart';
import './mealItem.dart';

class FoodCategoryDetails extends StatefulWidget {
  final List<MealOfFoodCategory> availableMeals;

  FoodCategoryDetails(this.availableMeals);

  @override
  _FoodCategoryDetailsState createState() => _FoodCategoryDetailsState();
}

class _FoodCategoryDetailsState extends State<FoodCategoryDetails> {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final category = routeArguments['category'];
    final categoryId = routeArguments['id'];
    final mealsCorrespondingToCategory = widget.availableMeals.where((meal) {
      return meal.categoryIds.contains(categoryId);
    }).toList();

    Widget displayingMeals() {
      if (mealsCorrespondingToCategory.length != 0) {
        return ListView.builder(
            itemCount: mealsCorrespondingToCategory.length,
            itemBuilder: (ctx, index) {
              {
                return MealItem(
                  id: mealsCorrespondingToCategory[index].id,
                  category: mealsCorrespondingToCategory[index].category,
                  imageURL: mealsCorrespondingToCategory[index].imageURL,
                  duration: mealsCorrespondingToCategory[index].duration,
                  complexity: mealsCorrespondingToCategory[index].complexity,
                );
              }
            });
      } else {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          child: Text(
            "No Meals for this category according to the selected filters",
            style: TextStyle(
                fontFamily: Theme.of(context).textTheme.title.fontFamily,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text(category)), body: displayingMeals());
  }
}
