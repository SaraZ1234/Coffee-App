import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/coffee_shop.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/cashondeliverypage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => const Signup(),
        '/HomePage': (context) => const HomePage(),
        '/CartPage': (context) => const CartPage(),
        '/CashOnDelivery': (context) => const CashOnDeliveryPage(),

      },
    );
  }
}
