import 'package:flutter/material.dart';
import 'package:flutter_apps/models/bird.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class BirdCard extends StatelessWidget {
  final Bird bird;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  const BirdCard({
    super.key,
    required this.bird,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = TypeChip.colorFor(bird.type);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: bird.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      bird.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: onFavoriteTap,
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                    ),
                    color: isFavorite ? Colors.pink : Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(bird.name)),
                  TypeChip(type: bird.type),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bird.description,
                style: const TextStyle(
                  letterSpacing: 1,
                  fontSize: 10,
                  fontFamily: "Poppins",
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}