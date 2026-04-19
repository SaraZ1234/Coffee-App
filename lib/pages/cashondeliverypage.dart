import 'package:flutter/material.dart';

class CashOnDeliveryPage extends StatelessWidget {
  const CashOnDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),

        title: const Text('Cash on Delivery',
        style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
        ),

        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.brown.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown.shade200),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.local_shipping, size: 60, color: Colors.brown),
              SizedBox(height: 16),
              Text("Thank you for your order!",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown)),
              SizedBox(height: 12),
              Text("You chose Cash on Delivery.\nYour total is \$12.99.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black87)),
              SizedBox(height: 16),
              Text("You'll receive a confirmation call soon.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
