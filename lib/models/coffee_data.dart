import 'package:flutter/material.dart';
import 'coffee_model.dart';

List <Coffee> _coffee_list_ = [

  Coffee(
    name: "Expresso",
    image: "assets/images/expresso.png",
    backgroundColor: Color(0xFFA52A2A),
    price: 3.50

  ),


  Coffee(
      name: "Latte",
      image: "assets/images/latte-art (1) pouring.png",
      backgroundColor: Color(0xFFD2B48C),
      price: 4.20

  ),

  Coffee(
      name: "Long Black",
      image: "assets/images/hot-coffee.png",
      backgroundColor: Color(0xFF8B4513),
      price: 4.18
  ),
  Coffee(
      name: "Cupcake",
      image: "assets/images/cupcake.png",
      backgroundColor: Color(0xFFD2691E)
      ,
      price: 4.18
  ),
  Coffee(
      name: "Iced Coffee",
      image: "assets/images/iced-coffee.png",
      backgroundColor: Color(0xFFCD853F

      ),
      price: 4.40
  ),
  Coffee(
      name: "Cake piece",
      image: "assets/images/piece-of-cake.png",
      backgroundColor: Color(0xFFBC8F8F)
      ,
      price: 4.18
  ),
  Coffee(
      name: "Biscotti",
      image: "assets/images/biscotti.png",
      backgroundColor: Color(0xFFA0522D)


      ,
      price: 4.3
  ),
  Coffee(
      name: "Coffee-beans",
      image: "assets/images/coffee-pack.png",
      backgroundColor: Color(0xFFF4A460)
      ,
      price: 4.3
  ),
  Coffee(
      name: "Green-tea",
      image: "assets/images/green.png",
      backgroundColor: Color(0xFFDEB887)
      ,
      price: 4.3
  ),
  Coffee(
      name: "Tea",
      image: "assets/images/tea.png",
      backgroundColor: Color(0xFF654321)
      ,
      price: 4.3
  ),
  Coffee(
      name: "Hot Chocolate",
      image: "assets/images/cocoa.png",
      backgroundColor: Color(0xFF4B3621)
      ,
      price: 4.3
  ),
];

List <Coffee> get coffeelist {
  return [..._coffee_list_];

}