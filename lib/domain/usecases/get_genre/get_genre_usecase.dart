import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';

abstract class GetGenreUsecase {
  Future<List<GenreEntity>> execute();
}
