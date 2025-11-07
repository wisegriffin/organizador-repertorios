class Music {
  Music({required this.id, required this.title});

  final int id;
  String title;
  String author = 'Unknown';
  String? content;
  String? key;

  Music fromMap(Map<String, Object?> map) {
    Music music = Music(
      id: map[MusicTable.columnId] as int,
      title: map[MusicTable.columnTitle].toString(),
    );

    final author = map[MusicTable.columnAuthor].toString();
    music.author = author.isEmpty ? music.author : author;

    music.content = map[MusicTable.columnContent].toString();
    music.key = map[MusicTable.columnKey].toString();

    return music;
  }
}

abstract class MusicTable {
  static const String tableName = 'musics';
  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnAuthor = 'author';
  static const String columnContent = 'content';
  static const String columnKey = 'key';

  static const List<String> allColumns = [
    columnId,
    columnTitle,
    columnAuthor,
    columnContent,
    columnKey,
  ];
}
