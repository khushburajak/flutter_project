import 'package:flutter/material.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  double principal = 0.0; // Principal amount
  double rate = 0.0; // Rate of interest
  double time = 0.0; // Time in years
  double result = 0.0; // Simple Interest result

  // Global key for form state
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              // Principal Input
              TextFormField(
                onChanged: (value) {
                  principal = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Principal Amount (P)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the principal amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Rate Input
              TextFormField(
                onChanged: (value) {
                  rate = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Rate of Interest (R)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rate of interest';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Time Input
              TextFormField(
                onChanged: (value) {
                  time = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Time (T) in Years',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time in years';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Display Result
              Text(
                'Simple Interest: $result',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),

              // Calculate Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        result = (principal * rate * time) / 100;
                      });
                    }
                  },
                  child: const Text('Calculate Simple Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
