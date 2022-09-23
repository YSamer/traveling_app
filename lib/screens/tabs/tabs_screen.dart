import 'package:flutter/material.dart';
import 'package:traveling_app/components/colors.dart';
import 'package:traveling_app/screens/categories/categories_screen.dart';
import 'package:traveling_app/screens/favorites/favorites_screen.dart';
import 'package:traveling_app/screens/tabs/components/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _screens = const [
    {'screen': CategoriesScreen(), 'title': 'تصنيفات الرحلات'},
    {'screen': FavoritesScreen(), 'title': 'الرحلات المفضلة'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['title']),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primarycolor,
        selectedItemColor: accentcolor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
