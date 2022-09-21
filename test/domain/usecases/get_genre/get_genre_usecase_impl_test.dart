import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/repository/genre_repository.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GenreRepositoryMock extends Mock implements GenreRepository {}

void main() {
  GenreRepositoryMock repository = GenreRepositoryMock();
  GetGenreUsecase usecase = GetGenreUsecaseImpl(repository: repository);

  test('deve retornar uma List de GenreEntity', () async {
    when(() => repository.getGenre()).thenAnswer((_) async => <GenreEntity>[]);
    final result = await usecase.execute();

    expect(result, isA<List<GenreEntity>>());
  });
}
