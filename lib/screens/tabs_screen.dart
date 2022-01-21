import 'package:flutter/material.dart';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0,
      child: Scaffold(
        appBar: NewGradientAppBar(
          // centerTitle: true,
          title: Text('Meals'),
          gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.indigo,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: const Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(widget.favoriteMeals),
          ],
        ),
      ),
    );
  }
}
