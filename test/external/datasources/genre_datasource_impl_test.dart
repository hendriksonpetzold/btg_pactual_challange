import 'package:btg_pactual_challange/external/datasources/genre_datasource_impl.dart';
import 'package:btg_pactual_challange/infra/datasources/genre_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  DioMock dio = DioMock();
  GenreDatasource datasource = GenreDatasourceImpl(dio: dio);

  test('deve retornar uma exception', () {
    when(() => dio.get(any())).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: 'path')));

    final result = datasource.getGenre;

    expect(
      () async {
        await result();
      },
      throwsException,
    );
  });
}
