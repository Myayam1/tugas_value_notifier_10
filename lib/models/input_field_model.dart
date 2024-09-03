import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/text_field_model.dart';

class InputFieldModel {
  final String shape; // nama dari bentuk: "rectangle"
  final String title; // judul yang akan ditampilkan: "Persegi Panjang"
  final List<TextFieldModel> textFieldModel; // informasi mengenai textfield: [TextFieldModel(_triangleSideController, "Masukkan sisi")]
  final ValueNotifier<double> result; // variable ValueNotifier yg akan digunakan
  final Function(String) onPressed; // function yg akan dijalankan ketika tombol ditekan. parameternya diisi bentuk: onPressed("rectangle")

  InputFieldModel(this.shape, this.title, this.textFieldModel, this.result, this.onPressed);
}
