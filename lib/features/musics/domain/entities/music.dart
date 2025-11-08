class Music {
  Music({
    required this.id,
    required this.title,
    this.author = 'Unknown',
    this.content,
    this.key,
  });

  final int id;
  final String title;
  final String author;
  final String? content;
  final String? key;

  Music fromMap(Map<String, Object?> map) {
    Music music = Music(
      id: map[MusicTable.columnId] as int,
      title: map[MusicTable.columnTitle].toString(),
      author: map[MusicTable.columnAuthor].toString(),
      content: map[MusicTable.columnContent].toString(),
      key: map[MusicTable.columnKey].toString(),
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

  static String createTable = '''
    CREATE TABLE IF NOT EXISTS music (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      author TEXT NOT NULL,
      content TEXT,
      key TEXT
    );
    ''';
}
