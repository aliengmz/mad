import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  String operation = "Add";
  bool includebonus = false;
  String result = "";

  void calculate() {
    double a = double.tryParse(num1.text) ?? 0;
    double b = double.tryParse(num2.text) ?? 0;

    double res = 0;

    if (operation == "Add") {
      res = a + b;
    } else if (operation == "Subtract") {
      res = a - b;
    } else if (operation == "Multiply") {
      res = a * b;
    } else if (operation == "Divide") {
      if (b != 0) {
        res = a / b;
      } else {
        setState(() {
          result = "Cannot divide by zero";
        });
        return;
      }
    }

    if (includebonus) {
      res += 10;
    }

    setState(() {
      result = "Result: ${res.toStringAsFixed(2)}";
    });
  }

  void reset() {
    setState(() {
      num1.clear();
      num2.clear();
      includebonus = false;
      operation = "Add";
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Calculator APP")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.calculate, size: 80),
                const SizedBox(height: 20),

                TextField(
                  controller: num1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter first number",
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: num2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter second number",
                  ),
                ),
                const SizedBox(height: 20),

                RadioListTile(
                  title: const Text("Add"),
                  value: "Add",
                  groupValue: operation,
                  onChanged: (val) {
                    setState(() {
                      operation = val.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: const Text("Subtract"),
                  value: "Subtract",
                  groupValue: operation,
                  onChanged: (val) {
                    setState(() {
                      operation = val.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: const Text("Multiply"),
                  value: "Multiply",
                  groupValue: operation,
                  onChanged: (val) {
                    setState(() {
                      operation = val.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: const Text("Divide"),
                  value: "Divide",
                  groupValue: operation,
                  onChanged: (val) {
                    setState(() {
                      operation = val.toString();
                    });
                  },
                ),

                CheckboxListTile(
                  value: includebonus,
                  title: const Text("Add Bonus +10"),
                  onChanged: (val) {
                    setState(() {
                      includebonus = val!;
                    });
                  },
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: calculate,
                  child: const Text("CALCULATE"),
                ),

                ElevatedButton(onPressed: reset, child: const Text("RESET")),

                const SizedBox(height: 20),

                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
