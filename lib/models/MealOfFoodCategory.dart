import 'package:flutter/material.dart';

enum Complexity { Simple, Normal, Challenging }

class MealOfFoodCategory {
  final String id;
  final List<String> categoryIds;
  final String category;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;

  final bool isSugarFree;
  final bool isLactoseFree;
  final bool isVegan;

  MealOfFoodCategory(
      {@required this.id,
      @required this.categoryIds,
      @required this.category,
      @required this.imageURL,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.isSugarFree,
      @required this.isLactoseFree,
      @required this.isVegan});
}
