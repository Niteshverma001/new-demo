import 'package:flutter/material.dart';
import 'package:project1/repository/screens/quickservice/quickservicescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("logo"),
        backgroundColor: Colors.transparent, // Removed background color
        elevation: 0, // Removes shadow for a cleaner look
        iconTheme: const IconThemeData(color: Colors.black), // Ensures icons are visible
        titleTextStyle: const TextStyle(
          color: Colors.black, // Ensures title text is visible
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),


        ],

      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Basket"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.grey, thickness: 0.5),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for vendors or services",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            // Quick Services Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Quick Services", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QuickServiceScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          CircleAvatar(radius: 30, backgroundColor: Colors.grey[300]),
                          const SizedBox(height: 5),
                          const Text("Label"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Top Vendors Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Top Vendors Near You", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),

            // Vendor List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Promoted Badge & Bookmark Icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text("Promoted", style: TextStyle(color: Colors.white)),
                                ),
                                const Icon(Icons.bookmark_border),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Ratings
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow, size: 16),
                                const SizedBox(width: 5),
                                const Text("4.3"),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Vendor Details
                            const Text("Vendor Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const Text("Services", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
