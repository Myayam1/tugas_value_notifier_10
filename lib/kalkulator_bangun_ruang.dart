// ignore_for_file: unused_local_variable, prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component_page/input_field_adapter.dart';
import 'models/input_field_model.dart';
import 'models/text_field_model.dart';

class HomePage extends StatefulWidget {
  @override
  _KalkulatorBangunRuangState createState() => _KalkulatorBangunRuangState();
}

class _KalkulatorBangunRuangState extends State<HomePage> {
  final TextEditingController _rusukController = TextEditingController();
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _jariController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  late List<InputFieldModel> inputFields;

  @override
  void initState() {
    super.initState();

    inputFields = [
      InputFieldModel(
        "cube",
        "Kubus",
        [
          TextFieldModel(_rusukController, "Masukkan rusuk"),
        ],
        ValueNotifier(0.0),
        (bentuk) => onPressed("cube"),
      ),
      InputFieldModel(
        "balok",
        "Balok",
        [
          TextFieldModel(_panjangController, "Masukkan panjang"),
          TextFieldModel(_lebarController, "Masukkan lebar"),
          TextFieldModel(_tinggiController, "Masukkan tinggi")
        ],
        ValueNotifier(0.0),
        (bentuk) => onPressed("balok"),
      ),
      InputFieldModel(
        "tube",
        "Tabung",
        [
          TextFieldModel(_jariController, "Masukkan jari-jari"),
          TextFieldModel(_heightController, "Masukkan tinggi")
        ],
        ValueNotifier(0.0),
        (shape) => onPressed("tube"),
      ),
    ];
  }

  // buat function ketika tombol di tekan
  void onPressed(String bentuk) {
    switch (bentuk.toLowerCase()) {
      case "cube":
        calculateCube();
        break;
      case "balok":
        calculateBalok();
        break;
      case "tube":
        calculateTube();
        break;
    }
  }

  void calculateCube() {
    double side = double.tryParse(_rusukController.text) ?? 0;

    inputFields.firstWhere((model) => model.shape == "cube").result.value =
        12 * (side);
  }

  void calculateBalok() {
    double base = double.tryParse(_panjangController.text) ?? 0;
    double side = double.tryParse(_lebarController.text) ?? 0;
    double height = double.tryParse(_tinggiController.text) ?? 0;

    inputFields.firstWhere((model) => model.shape == "balok").result.value =
        4 * (base + side + height);
  }

  void calculateTube() {
    double radius = double.tryParse(_jariController.text) ?? 0;
    double tinggi = double.tryParse(_heightController.text) ?? 0;

    inputFields.firstWhere((model) => model.shape == "tube").result.value =
        pi * radius * radius * tinggi;
  }

  // widget
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
            title: Text("Kalkulator Bangun Ruang"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
        ),
      ),
      // gtw sliverpadding ini apa, yg jelas biar ga error
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InputFieldAdapter(models: inputFields[index]);
                },
                childCount: inputFields.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
