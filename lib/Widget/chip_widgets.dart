import 'package:flutter/material.dart';

class ChipWidgets  extends StatelessWidget{
final Color color;
final String label;
final IconData icon;
final int value;
const ChipWidgets({super.key, required this.color, required this.label, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12
      ),
      decoration: BoxDecoration(
        color : color.withAlpha(40),
        borderRadius: BorderRadius.circular(14),
        border:Border.all(color: color.withAlpha(70))
      ),
      child : Row(
        children: [
          Icon(icon, size: 18, color: color),
          SizedBox(width: 8,),
          Text(label),
          Text(value.toString(), style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),)
        ],
      )
    );
  }
}