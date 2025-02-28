import 'package:flutter/material.dart';
import 'package:project1/repository/screens/addnewcard/addnewcardscreen.dart';
import 'package:project1/repository/screens/verification/verficationpaymentscreen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Credit & Debit Cards"),
              _buildPaymentOption("Axis Bank", "**** **** **** 8395", ""),
              _buildPaymentOption("HDFC Bank", "**** **** **** 6246", ""),
              _buildAddNewOption("Add New Card"),
              const SizedBox(height: 10),
              _buildSectionTitle("UPI"),
              _buildPaymentOption("Google Pay", "", ""),
              _buildPaymentOption("PhonePe", "", ""),
              _buildAddNewOption("Add New UPI ID"),
              const SizedBox(height: 10),
              _buildSectionTitle("More Payment Options"),
              _buildMorePaymentOption("Wallet"),
              _buildMorePaymentOption("Net Banking"),
              _buildMorePaymentOption("Cash on Delivery"),
              const SizedBox(height: 20),
              _buildPaymentSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildPaymentOption(String title, String subtitle, String assetPath) {
    return Card(
      child: ListTile(
        leading: Image.asset(assetPath, width: 40),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: Radio<String>(
          value: title,
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildAddNewOption(String title) {
    return ListTile(
      leading: const Icon(Icons.add, color: Colors.blue),
      title: Text(title, style: const TextStyle(color: Colors.blue)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNewCardScreen()),
        );
      },
    );
  }

  Widget _buildMorePaymentOption(String title) {
    return ListTile(
      leading: const Icon(Icons.payment, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("₹699", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: const Text("View detailed bill", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentCompletedScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
