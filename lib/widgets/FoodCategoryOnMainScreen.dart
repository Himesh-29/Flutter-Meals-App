import 'package:flutter/material.dart';

class FoodCategoryOnMainScreenCategoryItem extends StatelessWidget {
  final String id;
  final String category;
  final Color bgcolor;

  FoodCategoryOnMainScreenCategoryItem(this.category, this.bgcolor, this.id);

  static const routeName = '/categoryDetails';

  void navigateToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: {'category': category, 'id': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => navigateToDetails(context),
        splashColor: Colors.blue[100],
        child: Container(
            alignment: Alignment.center,
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            )),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bgcolor.withOpacity(0.6), bgcolor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
