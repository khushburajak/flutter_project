import 'package:flutter/material.dart';

class CircleAreaView extends StatefulWidget {
  const CircleAreaView({super.key});

  @override
  State<CircleAreaView> createState() => _CircleAreaViewState();
}

class _CircleAreaViewState extends State<CircleAreaView> {
  double radius = 0.0; // Radius of the circle
  double area = 0.0; // Calculated area of the circle

  // Global key for form state
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Area Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              // Radius Input
              TextFormField(
                onChanged: (value) {
                  radius = double.tryParse(value) ?? 0.0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Radius (r)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the radius';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Display Area
              Text(
                'Area of Circle: $area',
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
                        area = 3.14159 * radius * radius; // Area = πr²
                      });
                    }
                  },
                  child: const Text('Calculate Area'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
