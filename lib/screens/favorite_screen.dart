import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  FavoriteScreen(this.favoritedMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Center(
      child: Text('You hyave no favorite yet!'),
    );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitem(
          id : favoritedMeals[index].id,
          title: favoritedMeals[index].title,
          imageUrl: favoritedMeals[index].imageUrl,
          duration: favoritedMeals[index].duration,
          affordability: favoritedMeals[index].affordability,
          complexity: favoritedMeals[index].complexity,
          );
        },
        itemCount: favoritedMeals.length,
        );
    }
    
  }
}