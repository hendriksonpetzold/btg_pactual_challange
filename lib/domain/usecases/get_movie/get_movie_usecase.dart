import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';

abstract class GetMovieUsecase {
  Future<List<MovieEntity>> execute(int page);
}
