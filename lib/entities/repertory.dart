class Repertory {
  Repertory({required this.name, required this.id});

  final int id;
  String name;
  final List<String> musics = List.empty(growable: true);

  static Repertory fromMap(Map<String, Object?> map) {
    return Repertory(
      id: map[RepertoryTable.columnId] as int,
      name: map[RepertoryTable.columnName].toString(),
    );
  }
}

abstract class RepertoryTable {
  static const String tableName = 'repertories';
  static const String columnId = 'id';
  static const String columnName = 'name';

  static const List<String> allColumns = [columnId, columnName];
}
