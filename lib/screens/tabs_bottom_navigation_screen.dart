import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../widgets/gradient_appbar_item.dart';
import '../models/meal.dart';

class BottomNaviagtionScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  BottomNaviagtionScreen(this.favoriteMeals);

  @override
  _BottomNaviagtionScreenState createState() => _BottomNaviagtionScreenState();
}

class _BottomNaviagtionScreenState extends State<BottomNaviagtionScreen> {
  List<Map<String, Object>> _page;
  var _selectedPageIndex = 0;

  @override
  void initState() {
    _page = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        // because we cannt instiliste  widget.favoriteMeals in main class just onBuild or initState
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomGradientAppBar(
        _page[_selectedPageIndex]['title'],
      )
      /* NewGradientAppBar(
        // centerTitle: true,
        title: Text(_page[_selectedPageIndex]['title']),
        gradient: LinearGradient(
          colors: [
            Colors.cyan,
            Colors.indigo,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ) */
      ,
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFED2A1),
              Color(0xff644431),
              // Colors.cyan,
              // Colors.indigo,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          //showUnselectedLabels: false,
          //type: BottomNavigationBarType.shifting,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              // backgroundColor: Colors.transparent,
              icon: const Icon(Icons.category),
              // title: const Text('Categories'),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.transparent,
              icon: const Icon(Icons.star),
              // title:const Text('Favorites'),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
