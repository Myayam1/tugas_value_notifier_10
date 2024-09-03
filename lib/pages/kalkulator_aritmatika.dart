import 'package:flutter/material.dart';

class KalkulatorAritmatika extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final ValueNotifier<double> result = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aritmatika"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Pertama",
              ),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Angka Kedua",
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.tryParse(num1Controller.text) ?? 0;
                    double num2 = double.tryParse(num2Controller.text) ?? 0;
                    result.value = num1 + num2;
                  },
                  child: Text("Tambah"),
                ),
                ElevatedButton(
                  onPressed: () {
                    double num1 = double.tryParse(num1Controller.text) ?? 0;
                    double num2 = double.tryParse(num2Controller.text) ?? 0;
                    result.value = num1 - num2;
                  },
                  child: Text("Kurang"),
                ),ElevatedButton(
                  onPressed: () {
                    double num1 = double.tryParse(num1Controller.text) ?? 0;
                    double num2 = double.tryParse(num2Controller.text) ?? 0;
                    result.value = num1 * num2;
                  },
                  child: Text("Kali"),
                ),ElevatedButton(
                  onPressed: () {
                    double num1 = double.tryParse(num1Controller.text) ?? 0;
                    double num2 = double.tryParse(num2Controller.text) ?? 0;
                    result.value = num1 / num2;
                  },
                  child: Text("Bagi"),
                ),ElevatedButton(
                  onPressed: () {
                    double num1 = double.tryParse(num1Controller.text) ?? 0;
                    double num2 = double.tryParse(num2Controller.text) ?? 0;
                    result.value = num1 % num2;
                  },
                  child: Text("Modulus"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<double>(
              valueListenable: result,
              builder: (context, value, child) {
                return Text("Hasil: $value");
              },
            ),
          ],
        ),
      ),
    );
  }
}
