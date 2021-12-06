import 'package:flutter/material.dart';
import '../components/meal_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    
    //filtra as comidas por categorias
    //se for true tem a comida na categoria na lista
    final categoryMeals = DUMMY_MEALS.where((meal) {
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
