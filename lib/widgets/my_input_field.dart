import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/input_field_model.dart';
import 'package:tugas_state_management_zaff/widgets/my_button.dart';
import 'package:tugas_state_management_zaff/component_page/text_field_adapter.dart';
//lahposihndadaktakgawereusablebrutalmaraimumetdewe
// widget input utk setiap bentuk

class MyInputField extends StatelessWidget {
  final InputFieldModel model;

  const MyInputField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              model.title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Noto Sans'
              ),
            ),
            Column(
              // map ini seperti for loop, tapi hasilnya diconvert menjadi list. hasilnya akan menjadi seperti listview
              children: model.textFieldModel.map((textField) => TextFieldAdapter(textFieldModels: textField)).toList(),
            ),
            Row(
              children: [
                MyButton(
                  title: "Hitung",
                  parameter: model.shape,
                  onPressed: (shape) {
                    model.onPressed(shape);
                  },
                ),
                Spacer(),
                // ValueListenableBuilder untuk mengambil value dari ValueNotifier
                ValueListenableBuilder<double>(
                  valueListenable: model.result,
                  builder: (context, value, child) {
                    // ubah value agar hanya punya 2 angka dibelakang koma. seperti dari 3.14159... menjadi 3.14
                    String formattedValue = value.toStringAsFixed(2);
                    return Text(
                      'Hasil: $formattedValue',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Noto Sans'),
                    );
                  },
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
