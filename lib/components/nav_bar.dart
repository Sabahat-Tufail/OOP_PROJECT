import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_it/views/cart_page.dart';
import 'package:bag_it/views/favorite_page.dart';
import 'package:bag_it/utils/contants/global.dart';
import 'package:bag_it/views/home_page.dart';

import '../views/settings.dart';
import 'drawer.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    FavoritePage(),
    const CartPage(),
    MySettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grocery App',
          style: GoogleFonts.notoSerif(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffe4e7f6),
      ),
      drawer: AppDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: primaryColor,
        buttonBackgroundColor: primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: _onItemTapped,
      ),
    );
  }
}
