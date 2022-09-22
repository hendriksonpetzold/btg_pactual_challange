import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/repository/genre_repository.dart';
import 'package:btg_pactual_challange/infra/datasources/genre_datasource.dart';

import 'package:btg_pactual_challange/infra/repository/genre_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GenreDatasourceMock extends Mock implements GenreDatasource {}

void main() {
  GenreDatasourceMock datasource = GenreDatasourceMock();

  GenreRepository repository = GenreRepositoryImpl(datasource: datasource);

  test('deve retornar uma lista de GenreEntity', () async {
    when(() => datasource.getGenre()).thenAnswer((_) async => <GenreEntity>[]);
    final result = await repository.getGenre();
    expect(result, isA<List<GenreEntity>>());
  });

  test('deve retornar uma lista vazia', () async {
    when(() => datasource.getGenre()).thenThrow(Exception());
    final result = await repository.getGenre();
    expect(result, isEmpty);
  });
}
