import 'package:flutter/material.dart';

// Updated timeCard widget without Card, includes icon at top
Widget timeCard( String time, IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 20, color: Colors.blueAccent),


      const SizedBox(height: 4),
      Text(
        time,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
