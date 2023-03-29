import 'package:flutter/material.dart';
import 'package:coffee_app/models/coffee_shop.dart';
import 'package:coffee_app/const.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (BuildContext context, value, Widget? child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Tu Carrito',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (_, index) {
                    return _ListTile(
                      coffee: value.shop[index],
                    );
                  }),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                          title: Text('Pagando...'),
                        ));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: Text('Pagar',
                        style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
            )
          ]),
        ));
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  final Coffee coffee;
  const _ListTile({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('\$${coffee.price}'),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            final coffeeShop = Provider.of<CoffeeShop>(context, listen: false);

            coffeeShop.removeItemfromCart(coffee);

            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: backgroundColor,
                      title: const Text(
                          'Eliminado satisfactoriamente del carrito'),
                    ));
          },
        ),
      ),
    );
  }
}
