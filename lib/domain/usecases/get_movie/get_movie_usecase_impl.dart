// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/repository/movie_repository.dart';

import './get_movie_usecase.dart';

class GetMovieUsecaseImpl implements GetMovieUsecase {
  MovieRepository repository;
  GetMovieUsecaseImpl({
    required this.repository,
  });

  @override
  Future<List<MovieEntity>> execute(int page) async {
    return await repository.getMovie(page);
  }
}
