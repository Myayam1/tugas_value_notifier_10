import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/pages/kalkulator_aritmatika.dart';
import 'package:tugas_state_management_zaff/pages/kalkulator_bangun_ruang.dart';
import 'pages/kalkulator_bangun_datar.dart';
import 'pages/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageMenu(),
        routes: {
          '/kalkulator_bangunruang': (context) => KalkulatorBangunRuang(),
          '/kalkulator_bangundatar': (context) => KalkulatorBangunDatar(),
          '/kalkulator_aritmatika': (context) => KalkulatorAritmatika(),
          '/pagemenu': (context) => PageMenu(),
        }
    );
  }
}

