class Music {
  Music({required this.id, required this.name});

  final int id;
  String name;
  String? content;

  Music fromMap(Map<String, Object?> map) {
    return Music(
      id: map[MusicTable.columnId] as int,
      name: map[MusicTable.columnName].toString(),
    );
  }
}

abstract class MusicTable {
  static const String tableName = 'musics';
  static const String columnId = 'id';
  static const String columnName = 'name';

  static const List<String> allColumns = [columnId, columnName];
}
