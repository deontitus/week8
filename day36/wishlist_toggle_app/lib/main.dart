import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wishlist Toggle',
      theme: ThemeData.dark(),
      home: const WishlistPage(),
    );
  }
}

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  List<Map<String, dynamic>> products = [

    {
      "name": "iPhone 15",
      "price": "₹79,999",
      "liked": false,
    },

    {
      "name": "MacBook Air",
      "price": "₹1,14,999",
      "liked": false,
    },

    {
      "name": "Apple Watch",
      "price": "₹42,999",
      "liked": false,
    },

    {
      "name": "AirPods Pro",
      "price": "₹24,999",
      "liked": false,
    },

    {
      "name": "iPad Air",
      "price": "₹59,999",
      "liked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Wishlist Toggle"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: ListView.builder(

        itemCount: products.length,

        itemBuilder: (context, index) {

          final item = products[index];

          return Card(

            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: ListTile(

              contentPadding: const EdgeInsets.all(15),

              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.teal,
                child: Text(
                  item["name"][0],
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              title: Text(
                item["name"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  item["price"],
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              trailing: GestureDetector(

                onTap: () {

                  setState(() {

                    item["liked"] = !item["liked"];

                  });
                },

                child: Icon(

                  item["liked"]
                      ? Icons.favorite
                      : Icons.favorite_border,

                  color: item["liked"]
                      ? Colors.red
                      : Colors.grey,

                  size: 32,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}