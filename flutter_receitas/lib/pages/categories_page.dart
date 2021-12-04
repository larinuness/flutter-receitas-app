import 'package:flutter/material.dart';
import '../components/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos cozinhar?'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/chefe-de-cozinha.png',
              width: 45,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          //grid com scroll
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //cada elemento vai ter uma extensao no maximo de 200px
            maxCrossAxisExtent: 200,
            //tamanho da cada elemento
            childAspectRatio: 3 / 2,
            //espaçamento de 20 entre cada
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryItem(
              category: cat,
            );
          }).toList(),
        ),
      ),
    );
  }
}
