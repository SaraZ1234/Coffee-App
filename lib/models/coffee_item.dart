import 'package:coffeee_app/models/coffee_data.dart';
import 'package:flutter/material.dart';

class CoffeeItem extends StatelessWidget {
  final int index;

  CoffeeItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: coffeelist[index].backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    coffeelist[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       Colors.black12,
                  //       coffeelist[index].backgroundColor,
                  //     ],
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight,
                  //   ),
                  // ),
                  // child: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.add, color: Colors.white),
                  // ),
                ),
              ],
            ),
            Expanded(
              child: Hero(
                tag: coffeelist[index].image,
                child: Image.asset(
                  coffeelist[index].image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
