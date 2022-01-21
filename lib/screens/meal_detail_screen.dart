import 'package:flutter/material.dart';

import '../widgets/gradient_appbar_item.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavourite, this.isFavorite);

  Widget _buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // firstWhere stop checking were find first element where looking for.
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: MyCustomGradientAppBar(
        selectedMeal.title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, 'Ingredients'),
            Divider(
              indent: 100,
              endIndent: 100,
              color: Colors.black45,
              thickness: 1,
            ),
            _buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            _buildSectionTitle(context, 'Steps'),
            Divider(
              indent: 100,
              endIndent: 100,
              color: Colors.black45,
              thickness: 1,
            ),
            _buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '${(index + 1)}',
                      ),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider()
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
