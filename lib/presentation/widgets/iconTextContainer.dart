import 'package:flutter/material.dart';


Widget iconTextContainer(IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.blueAccent.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(color: Colors.blueAccent)),
      ],
    ),
  );
}

