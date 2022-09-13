// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/infra/adapter/movie_adapter.dart';
import 'package:btg_pactual_challange/infra/datasources/movie_datasource.dart';

import '../../domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieDatasource datasource;
  MovieRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<List<MovieEntity>> getMovie(int page) async {
    final result = await datasource.getMovie(page);

    return result.map((e) {
      return MovieAdapter.fromMap(e);
    }).toList();
  }
}
