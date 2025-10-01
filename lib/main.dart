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
                      TextButton(onPressed: () {},child: Text('7')),
                      TextButton(onPressed: () {},child: Text('8')),
                      TextButton(onPressed: () {},child: Text('9')),
                      TextButton(onPressed: () {},child: Text('/')),
                    ],
                  ),
                ),
              
                Expanded(
                  child: Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('4')),
                      TextButton(onPressed: () {}, child: Text('5')),
                      TextButton(onPressed: () {}, child: Text('6')),
                      TextButton(onPressed: () {}, child: Text('*')),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('1')),
                      TextButton(onPressed: () {}, child: Text('2')),
                      TextButton(onPressed: () {}, child: Text('3')),
                      TextButton(onPressed: () {}, child: Text('-')),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('C')),
                      TextButton(onPressed: () {}, child: Text('0')),
                      TextButton(onPressed: () {}, child: Text('.')),
                      TextButton(onPressed: () {}, child: Text('+')),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text('=')),
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