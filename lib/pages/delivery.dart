import 'package:flutter/material.dart';
import 'cardpaymentpage.dart';
import 'cashondeliverypage.dart';

// import 'ThankYouPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Coffee'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _paymentMethod = 'Cash on delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.coffee, color: Colors.white,
            size: 35,),
            // SizedBox(width: 8),
            Text(
              'Coffee Shop',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

            ),


          ],
        ),

        centerTitle: true,
        backgroundColor: Colors.brown[500],

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  keyboardType: TextInputType.streetAddress,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Address",
                    labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
                    prefixIcon: const Icon(Icons.home, color: Colors.brown),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
                    prefixIcon: const Icon(Icons.phone, color: Colors.brown),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payment Options',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                buildPaymentOption(
                  title: 'Cash on Delivery',
                  value: 'Cash on delivery',
                  icon: Icons.attach_money,
                ),
                const SizedBox(height: 10),
                buildPaymentOption(
                  title: 'Card',
                  value: 'Card',
                  icon: Icons.credit_card,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown, // Button background
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_paymentMethod == 'Cash on delivery') {
                      Navigator.pushNamed(context, '/CashOnDelivery');

                    } else if (_paymentMethod == 'Card') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CardPaymentPage()),
                      );
                    }

                  },
                  child: const Text(
                    'Confirm Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentOption({required String title, required String value, required IconData icon}) {
    bool isSelected = _paymentMethod == value;
    return Card(
      elevation: isSelected ? 4 : 2,
      color: isSelected ? Colors.brown.shade50 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: isSelected ? Colors.brown : Colors.brown.shade100),
      ),
      child: RadioListTile<String>(
        value: value,
        groupValue: _paymentMethod,
        onChanged: (selected) {
          setState(() {
            _paymentMethod = selected!;
          });
        },
        title: Row(
          children: [
            Icon(icon, color: Colors.brown),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        activeColor: Colors.brown,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
