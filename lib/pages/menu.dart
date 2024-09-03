import 'package:flutter/material.dart';

import '../models/menu_card_model.dart';
import '../widgets/menu_card.dart';

class PageMenu extends StatefulWidget {
  const PageMenu({super.key});

  @override
  State<PageMenu> createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  late List<MenuCardModel> model;

  @override
  void initState() {
    super.initState();
    // Initialize the model list here
    model = [
      MenuCardModel(
        name: "Kalkulator Aritmatika",
        desc: "Kalkulator penjumlahan, pengurangan, perkalian, dan lain-lain.",
        icon: Icons.calculate,
        route: "/kalkulator_aritmatika"
      ),
      MenuCardModel(
        name: "Kalkulator Keliling Bangun Datar",
        desc: "Kalkulator kelling persegi panjang, lingkaran, dan lain-lain.",
        icon: Icons.crop_square,
        route: "/kalkulator_bangundatar"
      ),
      MenuCardModel(
        name: "Kalkulator Keliling Bangun Ruang",
        desc: "Kalkulator keliling kubus, tabung, dan lain-lain.",
        icon: Icons.view_in_ar,
        route: "/kalkulator_bangunruang"
      ),
    ];
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
            title: Text("Beranda"),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return MenuCard(
            model: model[index],
          );
        },
      ),
    );
  }
}
