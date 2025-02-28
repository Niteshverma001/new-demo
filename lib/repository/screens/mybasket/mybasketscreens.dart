import 'package:flutter/material.dart';
import 'package:project1/repository/screens/payment/payment.dart';

class MyBasketScreen extends StatefulWidget {
  const MyBasketScreen({super.key});

  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {
  final List<Map<String, dynamic>> items = [
    {"category": "Dry Cleaning", "name": "Coat & Trousers", "price": 550, "quantity": 1},
    {"category": "Dry Cleaning", "name": "Jacket", "price": 250, "quantity": 1},
    {"category": "Wash & Iron", "name": "Shirts", "price": 20, "quantity": 1},
    {"category": "Wash & Iron", "name": "Saree", "price": 20, "quantity": 1},
  ];

  int get totalServiceCost => items.fold(0, (sum, item) => sum + (item["price"] as int) * (item["quantity"] as int));

  int get totalAmount => totalServiceCost + 5 + 5;

  void _updateQuantity(int index, int delta) {
    setState(() {
      items[index]["quantity"] = (items[index]["quantity"] as int) + delta;
      if (items[index]["quantity"] < 1) {
        items[index]["quantity"] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Basket"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAddressSection(),
            const SizedBox(height: 10),
            Expanded(child: _buildItemList()),
            _buildReceiptSection(),
            const SizedBox(height: 10),
            _buildContinueButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PaymentScreen()),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
      child: const Text("Continue"),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Deliver to: Akash Prajapati, 226680", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Flat no. 8, Apartment - 796"),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Change", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList() {
    return ListView(
      children: items.map((item) => _buildItemCard(items.indexOf(item))).toList(),
    );
  }

  Widget _buildItemCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(width: 50, height: 50, color: Colors.grey[300]),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(items[index]["name"], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("₹${items[index]["price"]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _buildQuantitySelector(index),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(int index) {
    return Row(
      children: [
        IconButton(onPressed: () => _updateQuantity(index, -1), icon: const Icon(Icons.remove)),
        Text("${items[index]["quantity"]}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        IconButton(onPressed: () => _updateQuantity(index, 1), icon: const Icon(Icons.add)),
      ],
    );
  }

  Widget _buildReceiptSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Price Details", style: TextStyle(fontWeight: FontWeight.bold)),
          _priceDetailRow("Service Cost", totalServiceCost),
          _priceDetailRow("Delivery Charge", 5),
          _priceDetailRow("Platform Fee", 5),
          const Divider(),
          _priceDetailRow("Total Amount", totalAmount, isBold: true),
        ],
      ),
    );
  }

  Widget _priceDetailRow(String label, int amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text("₹$amount", style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.directions), label: "Go"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
      ],
    );
  }
}
