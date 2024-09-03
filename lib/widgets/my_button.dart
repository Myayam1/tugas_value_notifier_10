import 'package:flutter/material.dart';
// widget button

class MyButton extends StatelessWidget {
  final String title;
  final String parameter; // Define the parameter field
  final Function(String) onPressed; // Callback that expects a String

  const MyButton({
    super.key,
    required this.title,
    required this.parameter, // Require the parameter
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(parameter), // Use the parameter
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Noto Sans',
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
      ),
    );
  }
}
