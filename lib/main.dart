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

  // store first operand
  double _firstOperand = 0;
  
  // Store operator
  String _operator = '';
  
  // Flag to check if we should start a new number
  bool _shouldResetDisplay = false;

  // Handle number button press (0-9)
  void handleNumberPress(String number) {
    setState(() {
      if (_display == '0' || _shouldResetDisplay) {
        _display = number;
        _shouldResetDisplay = false;
      } else {
        _display += number;
      }
    });
  }

  // Handle operator button press (+, -, *, /)
  void handleOperatorPress(String operator) {
    setState(() {
      _firstOperand = double.parse(_display);
      _operator = operator;
      _shouldResetDisplay = true;
    });
  }


  // Handle clear button press to reset calculator
  void handleClearPress() {
    setState(() {
      _display = '0';
      _firstOperand = 0;
      _operator = '';
      _shouldResetDisplay = false;
    });
  }

  // Handle decimal point button press
  void handleDecimalPress() {
    setState(() {
      if (_shouldResetDisplay) {
        _display = '0.';
        _shouldResetDisplay = false;
      } else if (!_display.contains('.')) {
        _display += '.';
      }
    });
  }

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
                      _buildButton('7', Colors.blue, () => handleNumberPress('7')),
                      _buildButton('8', Colors.blue, () => handleNumberPress('8')),
                      _buildButton('9', Colors.blue, () => handleNumberPress('9')),
                      _buildButton('/', Colors.orange, () => handleOperatorPress('/')),
                    ],
                  ),
                ),
              
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4', Colors.blue, () => handleNumberPress('4')),
                      _buildButton('5', Colors.blue, () => handleNumberPress('5')),
                      _buildButton('6', Colors.blue, () => handleNumberPress('6')),
                      _buildButton('*', Colors.orange, () => handleOperatorPress('*')),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1', Colors.blue, () => handleNumberPress('1')),
                      _buildButton('2', Colors.blue, () => handleNumberPress('2')),
                      _buildButton('3', Colors.blue, () => handleNumberPress('3')),
                      _buildButton('-', Colors.orange, () => handleOperatorPress('-')),
                    ],
                  ),
                ),
                
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('C', Colors.red, () => handleClearPress()),
                      _buildButton('0', Colors.blue, () => handleNumberPress('0')),
                      _buildButton('.', Colors.blue, () => handleDecimalPress()),
                      _buildButton('+', Colors.orange, () => handleOperatorPress('+')),
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