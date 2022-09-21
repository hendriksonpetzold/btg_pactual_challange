import 'package:btg_pactual_challange/external/datasources/movie_datasource_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MovieDatasourceImpl(dio: dio);

  test('deve retornar uma lista', () async {
    when(() => dio.get(any())).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions(path: 'path')));

    final result = await datasource.getMovie(1);
    expect(result, isA<List>());
  });
}
