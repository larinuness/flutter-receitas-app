import 'package:flutter/material.dart';
import '../components/meal_item.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key, required this.meals}) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    //filtra as comidas por categorias
    //se for true tem a comida na categoria na lista
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
