import 'package:flutter/material.dart';
import 'package:flutter_apps/models/bird.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class BirdList extends StatelessWidget {
  final Bird bird;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const BirdList({
    super.key,
    required this.bird,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: TypeChip.colorFor(bird.type), width: 1),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Hero(
          tag: bird.name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              bird.image,
              width: 67,
              height: 67,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          bird.name,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: TypeChip(type: bird.type),
        ),
        trailing: IconButton(
          onPressed: onFavoriteTap,
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: isFavorite ? Colors.pink : Colors.grey,
        ),
      ),
    );
  }
}