class Music {
  Music({
    required this.id,
    required this.title,
    String? author,
    this.content,
    this.key,
  }) : author = author ?? 'Unknown';

  final int id;
  final String title;
  final String author;
  final String? content;
  final String? key;

  static Music fromMap(Map<String, Object?> map) {
    final author = map[MusicTable.columnAuthor].toString();
    Music music = Music(
      id: map[MusicTable.columnId] as int,
      title: map[MusicTable.columnTitle].toString(),
      author: author.isNotEmpty ? author : null,
      content: map[MusicTable.columnContent].toString(),
      key: map[MusicTable.columnKey].toString(),
    );
    return music;
  }

  Map<String, Object?> toMap() {
    final map = {
      MusicTable.columnId: id,
      MusicTable.columnTitle: title,
      MusicTable.columnAuthor: author,
      MusicTable.columnContent: content,
      MusicTable.columnKey: key,
    };
    return map;
  }

  Music copy() {
    Music music = Music(
      id: id,
      title: title,
      author: author,
      content: content,
      key: key,
    );
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

  static String createTable =
      '''
    CREATE TABLE IF NOT EXISTS ${MusicTable.tableName} (
      ${MusicTable.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${MusicTable.columnTitle} TEXT NOT NULL,
      ${MusicTable.columnAuthor} TEXT NOT NULL,
      ${MusicTable.columnContent} TEXT,
      ${MusicTable.columnKey} TEXT
    );
    ''';
}
