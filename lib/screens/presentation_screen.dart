import 'package:flutter/material.dart';
import 'package:coffee_app/const.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/taza-de-cafe.png'),
            ),
            const SizedBox(height: 60),
            Column(
              children: const [
                Text('Bienvenidos',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('¿Como deseas el café?',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.w300))
              ],
            ),
            const SizedBox(height: 80),
            MaterialButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              minWidth: size,
              color: Colors.brown,
              child: const Text('Entrar en la tienda',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
