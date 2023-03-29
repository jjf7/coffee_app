import 'package:coffee_app/const.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoffeeShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Store',
        initialRoute: 'presentation',
        routes: {
          'presentation': (_) => const PresentationScreen(),
          'home': (_) => const HomeScreen(),
        },
        theme: ThemeData.light().copyWith(
          drawerTheme: DrawerThemeData(backgroundColor: backgroundColor),
        ),
      ),
    );
  }
}
