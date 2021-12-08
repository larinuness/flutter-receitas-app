import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';
import 'categories_page.dart';
import 'favorite_page.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsPage({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  @override
  void initState(){
    super.initState();
    
  }
  // int _selectedScreenIndex = 0;

  // final List<Widget> _screens = [
  //   const CategoriesPage(),
  //   const FavoritePage(),
  // ];

  // _selectedPage(int index) {
  //   setState(() {
  //     _selectedScreenIndex = index;
  //   });
  // }

  // final List<String> _titles = [
  //   'Lista de Categorias',
  //   'Meus Favoritos',
  // ];

  @override
  Widget build(BuildContext context) {
    // ----> 1 maneira de fazer navagação por aba <----
    // ---- fica no topo ----
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const MainDrawer(),
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
            ),
          ],
          //parte debaixo da appbar
          bottom: const TabBar(
            //cor de qual aba está
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categorias'),
              Tab(icon: Icon(Icons.star), text: 'Favoritos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesPage(),
            FavoritePage(
              favoriteMeals: widget.favoriteMeals,
            ),
          ],
        ),
      ),
    );

    // ----> 2 maneira de fazer navagação por aba <----
    // ---- fica no rodapé ----
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(_titles[_selectedScreenIndex]),
    //   ),
    //   //coloca navegação na lateral
    //   drawer: const MainDrawer(),
    //   body: _screens[_selectedScreenIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     unselectedItemColor: Colors.white,
    //     selectedItemColor: Colors.amber,
    //     currentIndex: _selectedScreenIndex,
    //     onTap: _selectedPage,
    //     backgroundColor: Theme.of(context).primaryColor,
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.category),
    //         label: 'Categoria',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.star),
    //         label: 'Favoritos',
    //       ),
    //     ],
    //   ),
    // );
  }
}
