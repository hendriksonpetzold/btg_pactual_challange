import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovie(int page);
}
