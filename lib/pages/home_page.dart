import 'package:coffeee_app/components/botton_nav_bar.dart';
import 'package:coffeee_app/const.dart';
import 'package:flutter/material.dart';
import 'package:coffeee_app/pages/coffee_detail_page.dart';  // Correct import

import 'cart_page.dart';
import 'shop_page.dart';
import 'package:coffeee_app/components/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // navigate Bottom bar

  int _selectedIndex = 0;
  void navigateBottomBar(int index)
  {
setState(() {
  _selectedIndex = index;
});
  }

  //pages
  final List<Widget> _pages =[
//shop page
ShopPage(),


  //cart page
    CartPage(),
    CoffeeDetailsPage(),  // Corrected from 'DetailsPage' to 'CoffeeDetailsPage'

    CoffeeMessageCardPage(),

    //Details Page
  ];


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: backgroundColor,
    //   bottomNavigationBar: MyBottomNavBar(
    //     onTabChange: (index) => navigateBottomBar(index),
    //   ),
    //   body: _pages[_selectedIndex],
    // );
    return Scaffold(
      backgroundColor: backgroundColor,  // Sets background color
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,  // Which tab is selected
        onTap: navigateBottomBar,  // Updates the selected index when a tab is clicked
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),  // Shop tab
            label: 'Shop',            // Tab label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),  // Cart tab
            label: 'Cart',                   // Tab label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),  // Details tab
            label: 'Details',           // Tab label
          ),
        ],
      ),
      body: _pages[_selectedIndex],  // Displays the selected page
    );

  }
}
