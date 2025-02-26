import 'package:flutter/material.dart';

class QuickServiceScreen extends StatelessWidget {
  const QuickServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Service"),
        backgroundColor: Colors.transparent, // Removed background color
        elevation: 0, // Removes shadow for a cleaner look
        iconTheme: const IconThemeData(color: Colors.black), // Ensures icons are visible
        titleTextStyle: const TextStyle(
          color: Colors.black, // Ensures title text is visible
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                  value: "Wash & Iron",
                                  items: ["Wash & Iron", "Dry Clean"]
                                      .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                                      .toList(),
                                  onChanged: (value) {},
                                ),
                                const Text(
                                  "₹18",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Add"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
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
