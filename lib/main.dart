import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_meals.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/util/constants.dart';
import 'package:meals_app/util/dimens.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    gluten: false,
    lactose: false,
    vegan: false,
    vegetarian: false,
  };

  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters[gluten]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters[lactose]! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters[vegan]! && !meal.isVegan) {
          return false;
        }
        if (_filters[vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String id) {
    final existingIndex = _favoritedMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(dummyMeals.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.pinkAccent,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: raleway,
        indicatorColor: Colors.amberAccent,
        textTheme: ThemeData().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: const TextStyle(
                fontSize: textThemeFontSize,
                fontFamily: robotoCondensed,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: const CategoriesScreen(),
      initialRoute: TabsScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        TabsScreen.routeName: (context) =>
            TabsScreen(favoriteMeals: _favoritedMeals),
        CategoriesMealsScreen.routeName: (context) =>
            CategoriesMealsScreen(availableMeals: _availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
            toggleFavorite: _toggleFavorite, isFavorite: isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, filters: _filters),
      },
    );
  }
}
