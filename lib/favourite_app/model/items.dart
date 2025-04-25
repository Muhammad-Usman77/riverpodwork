

class Itemss {
  final String name;
  final int id;
  final bool favourite;

  Itemss({required this.name, required this.id, required this.favourite});

  Itemss copyWith({
    String? name,
    int? id,
    bool? favourite

  }) {
    return Itemss(
        name: name ?? this.name,
        id: id ?? this.id,
        favourite: favourite ?? this.favourite);
  }
}
