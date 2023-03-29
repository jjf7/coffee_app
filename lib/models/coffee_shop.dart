import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _products = [
    Coffee(name: 'Late', price: 7.9, imagePath: 'assets/cafe1.png'),
    Coffee(name: 'Cappuchino', price: 8.7, imagePath: 'assets/cafe5.png'),
    Coffee(name: 'Black', price: 9.4, imagePath: 'assets/cafe3.png'),
    Coffee(name: 'Chocolate', price: 10.9, imagePath: 'assets/cafe4.png'),
  ];

  final List<Coffee> _shop = [];

  List<Coffee> get products => _products;
  List<Coffee> get shop => _shop;

  addItemToCart(Coffee coffee) {
    _shop.add(coffee);
    notifyListeners();
  }

  removeItemfromCart(Coffee coffee) {
    _shop.remove(coffee);
    notifyListeners();
  }
}
