import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((catdata) {
        return CategoryItem(
          title: catdata.title,
          color: catdata.color,
          id: catdata.id,
        );
      }).toList(),
    );
  }
}
