import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  static const page = "page";
  static const title = "title";

  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        page: const CategoriesScreen(),
        title: 'Categories',
      },
      {
        page: FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        title: 'Your Favorite',
      }
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedPage = _pages[_selectedPageIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPage[title].toString()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'Categories',
            // Add separate backgroundColor for BottomNavigationBarItem
            // if type: BottomNavigationBarType.shifting
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'Favorites',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: selectedPage[page] as Widget,
      drawer: const MainDrawer(),
    );
  }
}
