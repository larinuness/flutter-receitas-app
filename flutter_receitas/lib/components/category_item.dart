import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => CategoriesMealsPage(
    //       category: category,
    //     ),
    //   ),
    // );

    Navigator.of(context)
        .pushNamed(AppRoutes.categoriesMeals, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      // ---- Colocar cor quando clica ----
      // splashColor: Theme.of(context).primaryColor,
      onTap: () => _selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
