class Bird {
  final String name;
  final String image;
  final String type;
  final int power;
  final String description;
  final List<String> skills;
  final List<String> movies;
  final String ability;
  final Map<String, int> stats;

  const Bird({
    required this.name,
    required this.image,
    required this.type,
    required this.power,
    required this.description,
    required this.skills,
    required this.movies,
    required this.ability,
    required this.stats,
  });
}