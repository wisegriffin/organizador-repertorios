class Repertory {
  Repertory({required this.name, required this.id, required this.musics});

  final int id;
  String name;
  final List<String> musics;

  @override
  String toString() {
    return 'name: $name, ${musics.toString()}';
  }
}