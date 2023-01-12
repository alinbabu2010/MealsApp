import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_categories.dart';
import 'package:meals_app/util/dimens.dart';
import 'package:meals_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: gridViewPaddingAll,
      gridDelegate: gridViewDelegate,
      children: dummyCategories
          .map((category) => CategoryItem(
                category.id,
                category.title,
                category.color,
              ))
          .toList(),
    );
  }
}
