import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavourite;

  MealDetailsScreen(this.toggleFavorite, this.isFavourite);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.category),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text('${selectedMeal.category}',
                    style: TextStyle(
                        fontSize: 44,
                        color: Colors.purple[400],
                        fontWeight: FontWeight.w800,
                        decorationStyle: TextDecorationStyle.wavy,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        fontStyle: FontStyle.italic,
                        backgroundColor: Color.fromRGBO(230, 220, 245, 0.9))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Image.network(
                  selectedMeal.imageURL,
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'Ingredients required:',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.title.fontFamily,
                    fontSize: 28,
                    decoration: TextDecoration.underline,
                    backgroundColor: Color.fromRGBO(230, 220, 245, 0.9),
                    color: Colors.blue[900],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red[400], width: 2)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child:
                      ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Text(
                          '${index + 1}). ${selectedMeal.ingredients[index]}',
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .fontFamily));
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  'How to make this recipe? The Steps are as follows:',
                  style: TextStyle(
                    fontFamily: Theme.of(context).textTheme.title.fontFamily,
                    fontSize: 28,
                    decoration: TextDecoration.underline,
                    backgroundColor: Color.fromRGBO(230, 220, 245, 0.9),
                    color: Colors.blue[900],
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red[400], width: 2)),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Text('${index + 1}). ${selectedMeal.steps[index]}',
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .fontFamily));
                    },
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
              ]),
        ),
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(
           isFavourite(selectedMeal.id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(selectedMeal.id),
      ),
    );
  }
}