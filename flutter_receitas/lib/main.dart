import 'package:flutter/material.dart';

import 'pages/categories_meals_page.dart';
import 'pages/categories_page.dart';
import 'pages/meal_details_page.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  color: Colors.white),
              headline2: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  color: Colors.black54),
            ),
      ),
      routes: {
        AppRoutes.home: (context) => const CategoriesPage(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsPage(),
        AppRoutes.mealDetail: (context) => const MealDetailsPage(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/alguma-coisa') {
      //     return null;
      //   } else if (settings.name == '/alguma-outra-coisa') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return CategoriesPage();
      //       },
      //     );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const CategoriesPage();
      //     },
      //   );
      // },
    );
  }
}
