import 'package:flutter/material.dart';

class TextFieldModel {
  final TextEditingController controller; // controller untuk setiap textfield agar kita bisa mengambil isi textfieldnya
  final String hintText; // hintText tau sendiri lah. kalo gatau malu2in

  TextFieldModel(this.controller, this.hintText);
}