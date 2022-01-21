import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,

            // color: Theme.of(context).accentColor,
            // color: Color.fromRGBO(209, 161, 141, 1),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFED2A1),
                  Color(0xff644431),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
                // color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}
