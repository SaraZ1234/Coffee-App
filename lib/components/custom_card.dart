import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coffeee_app/models/coffee.dart';
import 'package:coffeee_app/models/coffee_shop.dart';
import 'package:coffeee_app/pages/cart_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      child: MaterialApp(
        home: CoffeeMessageCardPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class CoffeeMessageCardPage extends StatefulWidget {
  @override
  _CoffeeMessageCardPageState createState() => _CoffeeMessageCardPageState();
}

class _CoffeeMessageCardPageState extends State<CoffeeMessageCardPage> {
  String message = '';
  late TextEditingController _messageController;
  IconData selectedIcon = Icons.coffee;

  final List<IconData> availableIcons = [
    Icons.coffee,
    Icons.cake,
    Icons.celebration,
    Icons.card_giftcard,
    Icons.favorite,
  ];

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _messageController.addListener(() {
      setState(() {
        message = _messageController.text;
      });
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Send a Coffee Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[600],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Select Icon
            Text(
              'Select Icon',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 8),

            // Icon Selector
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableIcons.map((icon) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      icon: Icon(icon),
                      iconSize: 30,
                      color: selectedIcon == icon
                          ? Colors.brown[800]
                          : Colors.grey[500],
                      onPressed: () {
                        setState(() {
                          selectedIcon = icon;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Message Preview Card
            // Message Preview Card
            Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
                border: Border.all(
                  color: Colors.brown.shade200,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.brown.shade300.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      selectedIcon,
                      color: Colors.brown.shade700,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        message.isEmpty ? 'Your warm message goes here...' : message,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Caveat',
                          color: Colors.brown.shade900,
                          height: 1.3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 30),

            // Message Input Field
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    maxLength: 120,
                    controller: _messageController,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Write your coffee note...',
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 4),
                      child: Text(
                        '${message.length}/120',
                        style: TextStyle(
                          color: message.length >= 120
                              ? Colors.red
                              : Colors.brown[400],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Send Button
            ElevatedButton(
              onPressed: () {
                if (message.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please write a message before sending!')),
                  );
                } else {
                  Provider.of<CoffeeShop>(context, listen: false).addItemToCart(
                    Coffee(
                      name: message,
                      price: '80.00',
                      imagePath: "lib/Images/Imagesss/coffeenote.png",
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Note Added!')),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[600],
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add Note',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
