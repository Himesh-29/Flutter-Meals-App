import 'package:flutter/material.dart';
import 'package:meals_app/screens/Filters_Screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String gotTitle, IconData icondata, BuildContext context,
      Function tapHandler) {
    return ListTile(
        title: Text(gotTitle,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: Theme.of(context).textTheme.title.fontFamily,
            )),
        leading: Icon(icondata, size: 55),
        onTap: tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      Container(
          color: Colors.amber,
          height: MediaQuery.of(context).size.height * 0.25,
          alignment: Alignment.center,
          child: Text("What\'s on your mind?",
              style: TextStyle(
                fontSize: 30,
                color: Colors.red[900],
                fontWeight: FontWeight.bold,
                fontFamily: Theme.of(context).textTheme.title.fontFamily,
              ))),
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      buildListTile('Today\'s Meals', Icons.food_bank_outlined, context, () {
        Navigator.pushReplacementNamed(context, '/');
      }),
      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      buildListTile('Filters', Icons.filter_list, context, () {
        Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
      }),
    ]));
  }
}
