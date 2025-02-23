import 'package:flutter/material.dart';

class VerificationCompletedScreen extends StatelessWidget {
  const VerificationCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Optional: If you want to remove the AppBar space, use extendBodyBehindAppBar
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Check Icon
              Icon(
                Icons.check_circle,
                size: 80,
                color: Colors.black, // Adjust color to your preference
              ),
              const SizedBox(height: 20),
              // Verification Completed Text
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
