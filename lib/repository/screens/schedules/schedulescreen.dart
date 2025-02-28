import 'package:flutter/material.dart';
import 'package:project1/repository/screens/mybasket/mybasketscreens.dart';

class SchedulePickupScreen extends StatefulWidget {
  const SchedulePickupScreen({super.key});

  @override
  State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  int selectedDateIndex = 0;
  String? selectedTime;

  final List<String> pickupDates = [
    "Mon\n24/02",
    "Tue\n25/02",
    "Wed\n26/02",
    "Thu\n27/02",
  ];

  final List<String> pickupTimes = [
    "5pm - 6pm",
    "6pm - 7pm",
    "7pm - 8pm",
    "8pm - 9pm",
  ];

  void _selectTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  void _navigateToBasketScreen() {
    if (selectedTime != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyBasketScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Pickup"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
          color: Colors.black,
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
              "Pick-Up Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pickupDates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          pickupDates[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedDateIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pick-Up Time",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: pickupTimes
                  .map((time) => GestureDetector(
                onTap: () => _selectTime(time),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: time,
                        groupValue: selectedTime,
                        onChanged: (value) => _selectTime(value!),
                        activeColor: Colors.black,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ))
                  .toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedTime != null ? _navigateToBasketScreen : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                selectedTime != null ? Colors.black : Colors.grey,
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
    home: SchedulePickupScreen(),
  ));
}
