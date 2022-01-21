import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../widgets/gradient_appbar_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  //it will not work with this error because we use context and before class build .
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      //extract args from material route
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      //filter meal with the same selected category
      // displayedMeals = DUMMY_MEALS.where((meal) {
      //   return meal.categories.contains(categoryId);
      // }).toList();
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomGradientAppBar(
        categoryTitle,
      ) /* NewGradientAppBar(
        title: Text(categoryTitle),
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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(categoryMeals[index].title);
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
