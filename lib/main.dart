import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {

  // Variable to hold calculation result
  String _display = '0';

  // Build a calculator button widget
  Widget _buildButton(String label, Color color, VoidCallback onPressed) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              color: Colors.black87,
              child: Text(
                _display,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // Calculator buttons
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('7', Colors.blue, () {}),
                      _buildButton('8', Colors.blue, () {}),
                      _buildButton('9', Colors.blue, () {}),
                      _buildButton('/', Colors.orange, () {}),
                    ],
                  ),
                ),
              
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4', Colors.blue, () {}),
                      _buildButton('5', Colors.blue, () {}),
                      _buildButton('6', Colors.blue, () {}),
                      _buildButton('*', Colors.orange, () {}),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1', Colors.blue, () {}),
                      _buildButton('2', Colors.blue, () {}),
                      _buildButton('3', Colors.blue, () {}),
                      _buildButton('-', Colors.orange, () {}),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('C', Colors.red, () {}),
                      _buildButton('0', Colors.blue, () {}),
                      _buildButton('.', Colors.blue, () {}),
                      _buildButton('+', Colors.orange, () {}),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('=', Colors.green, () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}