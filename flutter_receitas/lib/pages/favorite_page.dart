import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class FavoritePage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritePage({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeicao favorita'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoriteMeals[index],
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
