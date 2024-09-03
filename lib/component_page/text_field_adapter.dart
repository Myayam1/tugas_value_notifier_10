import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/text_field_model.dart';
import 'package:tugas_state_management_zaff/widgets/my_text_field.dart';
// adapter textfield

class TextFieldAdapter extends StatelessWidget {
  final TextFieldModel textFieldModels;

  const TextFieldAdapter({super.key, required this.textFieldModels});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField(model: textFieldModels)
        ],
      ),
    );
  }
}
