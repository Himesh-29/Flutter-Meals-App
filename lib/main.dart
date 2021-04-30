import 'package:flutter/material.dart';

import './screens/mealDetailsScreen.dart';
import './widgets/FoodCategoryOnMainScreen.dart';
import './screens/TabScreen.dart';
import './widgets/FoodCategoryDetails.dart';
import './screens/Filters_Screen.dart';
import './dummy_data.dart';
import './models/MealOfFoodCategory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'sugar': false,
    'lactose': false,
    'vegan': false,
  };

  List<MealOfFoodCategory> availableMeals = DUMMY_MEALS;
  List<MealOfFoodCategory> favouriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['sugar'] && !meal.isSugarFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isMealFavourite(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Color.fromRGBO(245, 230, 225, 0.95),
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OrelegaOne',
              fontSize: 30,
            ),
            display1: TextStyle(
              fontFamily: 'OriginalSurfer',
              fontSize: 20,
            )),
      ),
      home: TabsScreen(favouriteMeals),
      routes: {
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
        FoodCategoryOnMainScreenCategoryItem.routeName: (ctx) =>
            FoodCategoryDetails(availableMeals),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(toggleFavourite, isMealFavourite),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => TabsScreen(favouriteMeals),
        );
      },
    );
  }
}
