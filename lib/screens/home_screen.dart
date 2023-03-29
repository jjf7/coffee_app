import 'package:flutter/material.dart';

import 'package:coffee_app/screens/screens.dart';
import 'package:coffee_app/widgets/widgets.dart';

import 'package:coffee_app/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  //pages

  final List<Widget> _pages = [
    // shopPage
    ShopScreen(),

    // cartPage

    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: Colors.black),
      drawer: const SideMenu(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
