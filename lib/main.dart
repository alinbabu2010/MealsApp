import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.pinkAccent,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto Condensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: const CategoriesScreen(),
      initialRoute: CategoriesScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoriesMealsScreen.routeName: (context) =>
            const CategoriesMealsScreen(),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen()
      },
    );
  }
}
