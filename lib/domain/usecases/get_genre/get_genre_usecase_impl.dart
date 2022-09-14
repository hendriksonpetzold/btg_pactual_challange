// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/repository/genre_repository.dart';

import './get_genre_usecase.dart';

class GetGenreUsecaseImpl implements GetGenreUsecase {
  GenreRepository repository;
  GetGenreUsecaseImpl({
    required this.repository,
  });
  @override
  Future<List<GenreEntity>> execute() {
    return repository.getGenre();
  }
}
