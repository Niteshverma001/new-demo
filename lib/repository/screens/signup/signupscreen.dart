import 'package:flutter/material.dart';
import 'package:project1/repository/screens/login/loginscreen.dart';
import 'package:project1/repository/screens/otp/otpscreen.dart'; // Ensure the correct import

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailPhoneController = TextEditingController();
  bool isTermsChecked = false;

  void _handleSignUp() {
    String name = _nameController.text.trim();
    String emailOrPhone = _emailPhoneController.text.trim();

    if (name.isEmpty || emailOrPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please fill in all required fields.")),
      );
      return;
    }

    if (!isTermsChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
            Text("Please accept the Terms and Conditions.")),
      );
      return;
    }

    // Navigate to OTP screen and pass the email or phone
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OTPVerificationScreen(
            emailOrPhone: emailOrPhone,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Sign up",
              style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Name Input Field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Email/Phone Input Field
            TextField(
              controller: _emailPhoneController,
              decoration: const InputDecoration(
                labelText: "Email/ Phone",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Terms & Conditions Checkbox
            Row(
              children: [
                Checkbox(
                  value: isTermsChecked,
                  onChanged: (value) {
                    setState(() {
                      isTermsChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "By checking the box you agree to our Terms and Conditions.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Send OTP Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: _handleSignUp,
                child: const Text("Send OTP"),
              ),
            ),
            const SizedBox(height: 15),

            // Login Text
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const LoginScreen()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already a member? ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // OR Divider
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("or"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),

            // Full-width Facebook button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.facebook, color: Colors.blue),
                label: const Text(
                  "Continue with Facebook",
                  style:
                  TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Full-width Google button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                label: const Text(
                  "Continue with Google",
                  style:
                  TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
