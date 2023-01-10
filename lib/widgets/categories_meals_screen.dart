import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoriesMealsScreen(
    this.categoryId,
    this.categoryTitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
