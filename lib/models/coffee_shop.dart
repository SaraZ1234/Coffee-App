import 'package:coffeee_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {

  //Coffee for sale list
  final List<Coffee> _shop = [
    // black coffee

    Coffee(
      name: 'Long Black',
      price: "4.18",
      imagePath: "lib/Images/Imagesss/hot-coffee.png",
    ),

    //Latte
    Coffee(
      name: 'Latte',
      price: "4.20",
      imagePath: "lib/Images/Imagesss/latte-art (1) pouring.png",
    ),
    //Expresso
    Coffee(
      name: 'Espresso',
      price: "3.50",
      imagePath: "lib/Images/Imagesss/expresso.png",
    ),

    //Iced
    Coffee(
      name: 'Iced Coffee',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/iced-coffee.png",
    ),
    Coffee(
      name: 'Cup Cake',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/cupcake.png",
    ),
    Coffee(
      name: 'Chocolate Cake',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/piece-of-cake.png",
    ),
    Coffee(
      name: 'Biscotti',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/biscotti.png",
    ),
    Coffee(
      name: 'Coffee-beans',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/coffee-pack.png",
    ),
    Coffee(
      name: 'Green-tea',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/green.png",
    ),
    Coffee(
      name: 'Tea',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/tea.png",
    ),
    Coffee(
      name: 'Hot Chocolate',
      price: "4.40",
      imagePath: "lib/Images/Imagesss/cocoa.png",
    ),
    Coffee(
      name: 'Card',
      price: "80",
      imagePath: "lib/Images/Imagesss/coffeenote.png",
    ),
  ];

  //user cart
  List<Coffee> _userCart = [
  ];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;


  //get user cart
  List <Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  int getQuantity(Coffee coffee) {
    return _userCart
        .where((item) => item == coffee)
        .length;
  }
}
