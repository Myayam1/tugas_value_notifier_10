import 'package:flutter/material.dart';
import '../widgets/my_text_field.dart'; // Make sure to import your custom text field widget
import '../widgets/my_button.dart'; // Make sure to import your custom button widget
import '../models/text_field_model.dart'; // Make sure to import your text field model

class KalkulatorAritmatika extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final ValueNotifier<double> result = ValueNotifier<double>(0.0);

  void _performOperation(String operation) {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    switch (operation) {
      case 'Tambah':
        result.value = num1 + num2;
        break;
      case 'Kurang':
        result.value = num1 - num2;
        break;
      case 'Kali':
        result.value = num1 * num2;
        break;
      case 'Bagi':
        result.value = num2 != 0 ? num1 / num2 : 0; // Prevent division by zero
        break;
      case 'Modulus':
        result.value = num2 != 0 ? num1 % num2 : 0; // Prevent division by zero
        break;
      default:
        result.value = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 7.0,
                spreadRadius: 2.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            title: Text("Kalkulator Aritmatika"),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              model: TextFieldModel(num1Controller, "Angka Pertama"),
            ),
            SizedBox(height: 16.0),
            MyTextField(
              model: TextFieldModel(num2Controller, "Angka Kedua"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  title: "+",
                  parameter: "Tambah",
                  onPressed: _performOperation,
                ),
                SizedBox(height: 10),
                MyButton(
                  title: "-",
                  parameter: "Kurang",
                  onPressed: _performOperation,
                ),
                SizedBox(height: 10),
                MyButton(
                  title: "×",
                  parameter: "Kali",
                  onPressed: _performOperation,
                ),
                SizedBox(height: 10),
                MyButton(
                  title: "÷",
                  parameter: "Bagi",
                  onPressed: _performOperation,
                ),
                SizedBox(height: 10),
                MyButton(
                  title: "%",
                  parameter: "Modulus",
                  onPressed: _performOperation,
                ),
              ],
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<double>(
              valueListenable: result,
              builder: (context, value, child) {
                return Text(
                  "Hasil: $value",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
