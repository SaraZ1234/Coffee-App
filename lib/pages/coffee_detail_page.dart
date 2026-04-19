import 'package:flutter/material.dart';
import '../models/coffee_model.dart';
import '../models/coffee_data.dart';
import '../models/coffee_item.dart';

class CoffeeDetailsPage extends StatefulWidget {
  const CoffeeDetailsPage({super.key});

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  String searchTerm = "";
  Coffee? selectedCoffee;

  @override
  Widget build(BuildContext context) {
    List<Coffee> filteredList = coffeelist
        .where((coffee) =>
        coffee.name.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.coffee, color: Colors.white, size: 35),
            Text(
              'offee Shop',
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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 110,
                width: 110,
                child: const Icon(
                  Icons.coffee,
                  color: Color(0xFF4B3621),
                  size: 91,
                ),
              ),
              const Text(
                "Search",
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchTerm = value;
                    selectedCoffee = null;
                  });
                },
              ),
              const SizedBox(height: 20),
              selectedCoffee != null
                  ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 30),
                        onPressed: () {
                          setState(() {
                            selectedCoffee = null;
                          });
                        },
                      ),
                      Center(
                        child: Hero(
                          tag: selectedCoffee!.image,
                          child: Image.asset(
                            selectedCoffee!.image,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        selectedCoffee!.name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "A delicious ${selectedCoffee!.name} made with love and premium beans. Perfect for any moment!",
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "\$${selectedCoffee!.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      // ⭐️ Rating stars
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 28,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
                  : Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2.5 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: filteredList.length,
                  itemBuilder: (ctx, idx) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCoffee = filteredList[idx];
                      });
                    },
                    child: CoffeeItem(
                      index: coffeelist.indexOf(filteredList[idx]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
