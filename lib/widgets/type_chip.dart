import 'package:flutter/material.dart';

class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip({super.key, required this.type});

  /// Satu-satunya tempat warna tipe didefinisikan.
  /// Dipakai juga oleh BirdCard dan BirdList.
  static Color colorFor(String type) {
    switch (type) {
      case 'Leader':
        return Colors.red;
      case 'Speed':
        return Colors.amber;
      case 'Explosive':
        return Colors.blueGrey;
      case 'Egg Bomber':
        return Colors.cyan;
      case 'Splitter':
        return Colors.blue;
      case 'Heavy':
        return Colors.deepOrange;
      case 'Boomerang':
        return Colors.green;
      case 'Inflater':
        return Colors.orange;
      case 'Bubble':
        return Colors.pink;
      case 'Legend':
        return Colors.deepPurple;
      default:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = colorFor(type);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(type),
    );
  }
}