import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/input_field_model.dart';
import 'package:tugas_state_management_zaff/widgets/my_input_field.dart';
// adapter model bentuk

class InputFieldAdapter extends StatelessWidget {
  final InputFieldModel models;

  const InputFieldAdapter({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInputField(model: models)
        ],
      ),
    );
  }
}
