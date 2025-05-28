import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, String url, IconData icon, String title) {
  return SizedBox(
    width: 160, // Controls card width to allow multiple in a row
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.pushNamed(context, url);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(width: 8), // Horizontal spacing in Row
              Text(title, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    ),
  );
}
