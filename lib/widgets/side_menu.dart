import 'package:coffee_app/const.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(
            height: 50,
          ),
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cafe3.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Container(),
          ),
          const SizedBox(
            height: 40,
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio', style: TextStyle(fontSize: 16)),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Acerca', style: TextStyle(fontSize: 16)),
          ),
          ListTile(
            onTap: () =>
                Navigator.pushReplacementNamed(context, 'presentation'),
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Salir', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
