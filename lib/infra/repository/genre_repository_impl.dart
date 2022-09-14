// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/infra/adapter/genre_adapter.dart';
import 'package:btg_pactual_challange/infra/datasources/genre_datasource.dart';

import '../../domain/repository/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  GenreDatasource datasource;
  GenreRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<List<GenreEntity>> getGenre() async {
    final result = await datasource.getGenre();
    return result.map((e) {
      return GenreAdapter.fromMap(e);
    }).toList();
  }
}
