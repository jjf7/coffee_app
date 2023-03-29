import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/const.dart';
import 'package:coffee_app/models/coffee_shop.dart';

import '../models/coffee.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (BuildContext context, value, Widget? child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('¿Como deseas el café?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.products.length,
                  itemBuilder: (_, index) {
                    return _ListTile(
                      coffee: value.products[index],
                    );
                  }),
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
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: () {
            final coffeeShop = Provider.of<CoffeeShop>(context, listen: false);

            coffeeShop.addItemToCart(coffee);

            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: backgroundColor,
                      title:
                          const Text('Agregado satisfactoriamente al carrito'),
                    ));
          },
        ),
      ),
    );
  }
}
