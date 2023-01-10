import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const String routeName = 'categories_meals';

  const CategoriesMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'].toString();
    final String categoryId = routeArgs['id'].toString();
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
