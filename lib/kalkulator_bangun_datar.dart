import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/component_page/input_field_adapter.dart';
import 'package:tugas_state_management_zaff/models/input_field_model.dart';
import 'package:tugas_state_management_zaff/models/text_field_model.dart';

class KalkulatorBangunDatar extends StatefulWidget {
  @override
  _KalkulatorBangunDatarState createState() => _KalkulatorBangunDatarState();
}

class _KalkulatorBangunDatarState extends State<KalkulatorBangunDatar> {
  // buat controller utk setiap textbox yg diperlukan
  final TextEditingController _rectangleHeightController = TextEditingController();
  final TextEditingController _rectangleWidthController = TextEditingController();
  final TextEditingController _triangleSideController = TextEditingController();
  final TextEditingController _circleRadiusController = TextEditingController();

  // variable array model untuk setiap bentuk.
  late List<InputFieldModel> inputFields;

  @override
  void initState() {
    super.initState();

    // isi array model untuk setiap bentuk (penjelasan lebih lengkap di models/input_field_model)
    inputFields = [
      InputFieldModel(
        "rectangle",
        "Persegi Panjang",
        [
          TextFieldModel(_rectangleHeightController, "Masukkan tinggi"),
          TextFieldModel(_rectangleWidthController, "Masukkan lebar")
        ],
        ValueNotifier(0.0), // buat ValueNotifier nya di dalam sini untuk setiap bentuk
            (shape) => onPressed("rectangle"),
      ),
      InputFieldModel(
        "triangle",
        "Segitiga Sama Sisi",
        [TextFieldModel(_triangleSideController, "Masukkan sisi")],
        ValueNotifier(0.0),
            (shape) => onPressed("triangle"),
      ),
      InputFieldModel(
        "circle",
        "Lingkaran",
        [TextFieldModel(_circleRadiusController, "Masukkan jari-jari")],
        ValueNotifier(0.0),
            (shape) => onPressed("circle"),
      ),
    ];
  }

  // buat function ketika tombol di tekan
  void onPressed(String shape) {
    switch(shape.toLowerCase()) {
      case "rectangle":
        calculateRectangle();
        break;
      case "triangle":
        calculateTriangle();
        break;
      case "circle":
        calculateCircle();
        break;
    }
  }

  void calculateRectangle() {
    // ambil double dari textField menggunakan controller tadi
    double base = double.tryParse(_rectangleHeightController.text) ?? 0;
    double side = double.tryParse(_rectangleWidthController.text) ?? 0;

    // masukkan hasil perhitungan ke dalam ValueNotifier yang dibuat di dalam array model tadi. masukkan sesuai dengan nama bentuk
    inputFields.firstWhere((model) => model.shape == "rectangle").result.value = 2 * (base + side);
  }

  void calculateTriangle() {
    double side = double.tryParse(_triangleSideController.text) ?? 0;
    inputFields.firstWhere((model) => model.shape == "triangle").result.value = side * 3;
  }

  void calculateCircle() {
    double radius = double.tryParse(_circleRadiusController.text) ?? 0;
    inputFields.firstWhere((model) => model.shape == "circle").result.value = 2 * pi * radius;
  }

  // widget (ga perlu diganti)
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
            title: Text("Kalkulator Keliling Bangun Datar"),
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
