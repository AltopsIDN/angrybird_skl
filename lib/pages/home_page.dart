import 'package:flutter/material.dart';
import 'package:flutter_apps/data/bird_data.dart';
import 'package:flutter_apps/models/bird.dart';
import 'package:flutter_apps/pages/detail_page.dart';
import 'package:flutter_apps/widgets/bird_card.dart';
import 'package:flutter_apps/widgets/bird_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = "";
  bool _showFavoriteOnly = false;
  final Set<String> _favoriteBirds = {};
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleFavorite(String name) {
    setState(() {
      if (_favoriteBirds.contains(name)) {
        _favoriteBirds.remove(name);
      } else {
        _favoriteBirds.add(name);
      }
    });
  }

  Future<void> _openDetail(Bird bird, bool isFavorite) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(bird: bird, isFavorite: isFavorite),
      ),
    );
    if (result != null) {
      setState(() {
        if (result) {
          _favoriteBirds.add(bird.name);
        } else {
          _favoriteBirds.remove(bird.name);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // filter burung berdasarkan kata kunci & favorit
    final filtered = dataBirds.where((b) {
      final q = _searchQuery.toLowerCase();
      final matchesSearch = b.name.toLowerCase().contains(q);
      final matchesFavorite =
          !_showFavoriteOnly || _favoriteBirds.contains(b.name);
      return matchesSearch && matchesFavorite;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Angry Birds",
          style: TextStyle(
            fontFamily: "AngryBirds",
            fontSize: 32,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        actions: [Text('$screenSize')],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search Bird",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Switch(
                  value: _showFavoriteOnly,
                  onChanged: (value) {
                    setState(() {
                      _showFavoriteOnly = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // <=504 mobile, >=768 tablet, >=1024 desktop
                if (constraints.maxWidth <= 504) {
                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final bird = filtered[index];
                      final isFavorite = _favoriteBirds.contains(bird.name);
                      return BirdList(
                        bird: bird,
                        isFavorite: isFavorite,
                        onTap: () => _openDetail(bird, isFavorite),
                        onFavoriteTap: () => _toggleFavorite(bird.name),
                      );
                    },
                  );
                } else {
                  int column = 2;
                  if (constraints.maxWidth >= 768) column = 3;
                  if (constraints.maxWidth >= 1024) column = 4;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: column,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final bird = filtered[index];
                      final isFavorite = _favoriteBirds.contains(bird.name);
                      return BirdCard(
                        bird: bird,
                        isFavorite: isFavorite,
                        onTap: () => _openDetail(bird, isFavorite),
                        onFavoriteTap: () => _toggleFavorite(bird.name),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}