import 'package:flutter/material.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Kalkulator Aritmatika"),
            onTap: () {
              Navigator.pushNamed(context, '/kalkulator_aritmatika');
            },
          ),
          ListTile(
            title: Text("Kalkulator Bangun Datar"),
            onTap: () {
              Navigator.pushNamed(context, '/kalkulator_bangundatar');
            },
          ),
          ListTile(
            title: Text("Kalkulator Bangun Ruang"),
            onTap: () {
              Navigator.pushNamed(context, '/kalkulator_bangunruang');
            },
          ),
        ],
      ),
    );
  }
}
