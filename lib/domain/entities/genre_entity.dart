class GenreEntity {
  final int id;
  final String name;
  GenreEntity({
    required this.id,
    required this.name,
  });

  @override
  String toString() => 'GenreEntity(id: $id, name: $name)';
}
