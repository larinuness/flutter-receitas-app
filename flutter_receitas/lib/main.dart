import 'package:flutter/material.dart';
import 'models/settings.dart';

import 'pages/categories_meals_page.dart';
import 'pages/meal_details_page.dart';
import 'pages/settings_page.dart';
import 'pages/tabs_page.dart';
import 'utils/app_routes.dart';
import 'data/dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  //usada pra filtrar as comidas
  // ignore: prefer_final_fields
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final finalVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !finalVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
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
        AppRoutes.home: (context) => TabsPage(
              favoriteMeals: _favoriteMeals,
            ),
        //passa as comidas que vai ficar disponiveis quando usar o filtro
        AppRoutes.categoriesMeals: (context) => CategoriesMealsPage(
              meals: _availableMeals,
            ),
        AppRoutes.mealDetail: (context) => MealDetailsPage(
              onToggleFavorite: _toggleFavorite,
            ),
        AppRoutes.settings: (context) => SettingsPage(
              onSettingsChange: _filterMeals,
              settings: settings,
            ),
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
