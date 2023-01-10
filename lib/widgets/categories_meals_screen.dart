import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text("The recipes for the category"),
      ),
    );
  }
}
