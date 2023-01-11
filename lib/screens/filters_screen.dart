import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filter_screen';
  final Function saveFilters;
  final Map<String, bool> filters;

  const FiltersScreen({
    Key? key,
    required this.saveFilters,
    required this.filters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters['Gluten']!;
    _vegetarian = widget.filters['Vegetarian']!;
    _vegan = widget.filters['Vegan']!;
    _lactoseFree = widget.filters['Lactose']!;
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updatedValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: currentValue,
      onChanged: updatedValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final filters = {
                'Gluten': _glutenFree,
                'Lactose': _lactoseFree,
                'Vegan': _vegan,
                'Vegetarian': _vegetarian,
              };
              widget.saveFilters(filters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Gluten-free",
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (isGlutenFree) {
                    setState(() => _glutenFree = isGlutenFree);
                  },
                ),
                buildSwitchListTile(
                  "Lactose-free",
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (isLactoseFree) {
                    setState(() => _lactoseFree = isLactoseFree);
                  },
                ),
                buildSwitchListTile(
                  "Vegetarian",
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (isVegetarian) {
                    setState(() => _vegetarian = isVegetarian);
                  },
                ),
                buildSwitchListTile(
                  "Vegan",
                  'Only include vegan meals.',
                  _vegan,
                  (isVegan) {
                    setState(() => _vegan = isVegan);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
