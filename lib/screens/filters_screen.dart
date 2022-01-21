import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../widgets/gradient_appbar_item.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetaian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetaian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwithListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomGradientAppBar(
        'Your Filters',
        myActions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetaian,
                'vegan': _vegan,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwithListTile(
                'Gluten-free',
                'Only include gluten-free meals.',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwithListTile(
                'Lactose-free',
                'Only include lactose-free meals.',
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              _buildSwithListTile(
                'Vegetaian',
                'Only include vegetaian meals.',
                _vegetaian,
                (newValue) {
                  setState(
                    () {
                      _vegetaian = newValue;
                    },
                  );
                },
              ),
              _buildSwithListTile(
                'Vegan',
                'Only include vegan meals.',
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
