import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/models/bird.dart';
import 'package:flutter_apps/widgets/type_chip.dart';

class DetailPage extends StatefulWidget {
  final Bird bird;
  final bool isFavorite;

  const DetailPage({super.key, required this.bird, required this.isFavorite});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _handleBack() {
    Navigator.pop(context, _isFavorite);
  }

  // Bagian info dipakai bersama oleh layout mobile & tablet
  Widget _buildInfo(Bird bird) {
    const titleStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bird.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: TypeChip(type: bird.type),
        ),
        const SizedBox(height: 15),
        Text(
          'Power: ${bird.power}',
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text('Ability: ${bird.ability}', style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 15),
        const Text('Deskripsi', style: titleStyle),
        const SizedBox(height: 3),
        Text(
          bird.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 15),
        const Text('Skill', style: titleStyle),
        const SizedBox(height: 5),
        Wrap(
          children: bird.skills
              .map(
                (e) => Container(
              width: 140,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.1, color: Colors.black),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(width: 5),
                  Flexible(child: Text(e, overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
          )
              .toList(),
        ),
        const SizedBox(height: 15),
        const Text('Stats', style: titleStyle),
        const SizedBox(height: 5),
        ...bird.stats.entries.map(
              (s) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: [
                SizedBox(width: 90, child: Text(s.key)),
                Expanded(
                  child: LinearProgressIndicator(
                    value: s.value / 100,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                    color: TypeChip.colorFor(bird.type),
                  ),
                ),
                const SizedBox(width: 8),
                Text('${s.value}'),
              ],
            ),
          ),
        ),
        if (bird.movies.isNotEmpty) ...[
          const SizedBox(height: 15),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: bird.movies
                .map(
                  (item) => Image.network(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
                .toList(),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bird = widget.bird;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            bird.name,
          ),
          leading: IconButton(
            onPressed: _handleBack,
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              icon: _isFavorite
                  ? const Icon(Icons.favorite, color: Colors.pink)
                  : const Icon(
                Icons.favorite_border_rounded,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 15),
          ],
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              // Tablet / desktop
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: bird.name,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(bird.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(child: _buildInfo(bird)),
                    ),
                  ),
                ],
              );
            }

            // Mobile
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(bird.image),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                      start: 14,
                      end: 14,
                      top: 20,
                      bottom: 14,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 12,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _buildInfo(bird),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}