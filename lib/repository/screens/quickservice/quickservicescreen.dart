import 'package:flutter/material.dart';
import 'package:project1/repository/screens/schedules/schedulescreen.dart';

class QuickServiceScreen extends StatefulWidget {
  const QuickServiceScreen({super.key});

  @override
  State<QuickServiceScreen> createState() => _QuickServiceScreenState();
}

class _QuickServiceScreenState extends State<QuickServiceScreen> {
  final List<String> services = ["Wash & Iron", "Dry Clean"];
  final List<String> selectedServices = List.generate(13, (index) => "Wash & Iron");
  final List<int> quantities = List.generate(13, (index) => 0);
  int selectedItemCount = 0;

  void _updateSelection(int index, String? value) {
    if (value != null) {
      setState(() {
        selectedServices[index] = value;
      });
    }
  }

  void _increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
      selectedItemCount = quantities.reduce((a, b) => a + b);
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 0) {
        quantities[index]--;
        selectedItemCount = quantities.reduce((a, b) => a + b);
      }
    });
  }

  void _navigateToScheduleScreen() {
    if (selectedItemCount > 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SchedulePickupScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Service"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedItemCount > 0)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$selectedItemCount Item${selectedItemCount > 1 ? 's' : ''} Added to your Basket",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text("View Basket"),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            const Text(
              "Quick Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "T-Shirts",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                DropdownButton<String>(
                                  value: selectedServices[index],
                                  items: services.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                                  onChanged: (value) => _updateSelection(index, value),
                                ),
                                const Text("₹18", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          quantities[index] == 0
                              ? ElevatedButton(
                            onPressed: () => _increaseQuantity(index),
                            child: const Text("Add"),
                          )
                              : Row(
                            children: [
                              IconButton(
                                onPressed: () => _decreaseQuantity(index),
                                icon: const Icon(Icons.remove, color: Colors.black),
                              ),
                              Text(
                                "${quantities[index]}",
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () => _increaseQuantity(index),
                                icon: const Icon(Icons.add, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedItemCount > 0 ? _navigateToScheduleScreen : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedItemCount > 0 ? Colors.black : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.directions), label: "Go"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: QuickServiceScreen(),
  ));
}