import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';

abstract class GenreRepository {
  Future<List<GenreEntity>> getGenre();
}
