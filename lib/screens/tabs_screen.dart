import 'package:flutter/material.dart';
import '../screens/favourites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(),
      'title': 'Favourites',
    },
  ];

  int _selectedPageInex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageInex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageInex]['title']),
      ),
      body: _pages[_selectedPageInex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageInex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            title: const Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star),
            title: const Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
