import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/repository/movie_repository.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  final usecase = GetMovieUsecaseImpl(repository: repository);

  test('deve retornar uma lista de MovieEntity', () async {
    when(() => repository.getMovie(any()))
        .thenAnswer((_) async => <MovieEntity>[]);
    final result = await usecase.execute(1);
    expect(result, isA<List<MovieEntity>>());
  });
}
