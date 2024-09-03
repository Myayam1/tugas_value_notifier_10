import 'package:flutter/material.dart';
import 'package:tugas_state_management_zaff/models/menu_card_model.dart';

class MenuCard extends StatelessWidget {
  final MenuCardModel model;

  const MenuCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, model.route);
      },
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                model.icon, // Use the icon from the model
                size: 30.0,
                color: Colors.deepPurple,
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      model.desc,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 30.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
