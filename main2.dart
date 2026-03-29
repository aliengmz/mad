import 'package:flutter/material.dart';

void main() {
  runApp(const ComplexLayoutApp());
}

class ComplexLayoutApp extends StatelessWidget {
  const ComplexLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Layout'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // --- Row 1: Profile Header ---
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.edit, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 30),

              // --- Row 2: Stats Row ---
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.blue[100],
                      child: const Center(child: Text('Posts')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.red[100],
                      child: const Center(child: Text('Followers')),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      color: Colors.orange[100],
                      child: const Center(child: Text('Following')),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
