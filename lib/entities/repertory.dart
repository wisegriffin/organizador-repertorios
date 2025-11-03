class Repertory {
  Repertory({required this.name, required this.id});

  final int id;
  String name;
  final List<String> musics = List.empty(growable: true);

  static Repertory fromMap(Map<String, Object?> map) {
    return Repertory(id: map['id'] as int, name: map['name'].toString());
  }
}
