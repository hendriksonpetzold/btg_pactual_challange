import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/infra/datasources/movie_datasource.dart';
import 'package:btg_pactual_challange/infra/repository/movie_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MovieDatasourceMock extends Mock implements MovieDatasource {}

void main() {
  final datasource = MovieDatasourceMock();
  final repository = MovieRepositoryImpl(datasource: datasource);

  test('deve retornar uma lista de MovieEntity', () async {
    when(() => datasource.getMovie(any()))
        .thenAnswer((_) async => <MovieEntity>[]);
    final result = await repository.getMovie(1);

    expect(result, isA<List<MovieEntity>>());
  });

  test('deve retornar uma lista vaziay', () async {
    when(() => datasource.getMovie(any())).thenThrow(Exception());
    final result = await repository.getMovie(1);

    expect(result, isA<List<MovieEntity>>());
  });
}
