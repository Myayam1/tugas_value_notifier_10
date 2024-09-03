import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/text_field_model.dart';
// widget textfield

class MyTextField extends StatefulWidget {
  final TextFieldModel model;

  const MyTextField({super.key, required this.model});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextField(
        controller: widget.model.controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: widget.model.hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
