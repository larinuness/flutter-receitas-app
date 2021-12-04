import 'package:flutter/material.dart';
import 'package:flutter_receitas/models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  const MealDetailsPage({Key? key}) : super(key: key);

  _createSectionTitle(context, String title) {}

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Ingredientes',
                style: Theme.of(context).textTheme.headline2),
          ),
          Container(
            width: 300,
            height: 250,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        meal.ingredients[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
