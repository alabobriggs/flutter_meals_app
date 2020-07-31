import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no favourites, start adding some'),
    );
  }
}
