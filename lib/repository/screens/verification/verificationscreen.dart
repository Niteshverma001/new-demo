import 'package:flutter/material.dart';
import 'dart:async';
import 'package:project1/repository/screens/home/homescreen.dart';
 // Ensure this file contains HomeScreen

class VerificationCompletedScreen extends StatefulWidget {
  const VerificationCompletedScreen({super.key});

  @override
  _VerificationCompletedScreenState createState() => _VerificationCompletedScreenState();
}

class _VerificationCompletedScreenState extends State<VerificationCompletedScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              const Text(
                "Verification Completed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VerificationCompletedScreen(),
  ));
}
