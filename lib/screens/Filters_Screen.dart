import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isSugarFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;

  @override
  initState() {
    isSugarFree = widget.currentFilters['sugar'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String category,
    String subcategory,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(category,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.display1.fontFamily,
            fontSize: 20,
          )),
      value: currentValue,
      subtitle: Text(
        subcategory,
        style: TextStyle(
          fontFamily: Theme.of(context).textTheme.display1.fontFamily,
          fontSize: 16,
        ),
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_sharp),
            onPressed: () {
              final selectedFilters = {
                'sugar': isSugarFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.title.fontFamily,
                  fontSize: 28),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Sugar-free',
                  'Do you want sugar-free meals? ',
                  isSugarFree,
                  (newValue) {
                    setState(
                      () {
                        isSugarFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Do you want lactose-free meals? ',
                  isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Do you want vegan meals? ',
                  isVegan,
                  (newValue) {
                    setState(
                      () {
                        isVegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
