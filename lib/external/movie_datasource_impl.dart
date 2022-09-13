// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../infra/datasources/movie_datasource.dart';

class MovieDatasourceImpl implements MovieDatasource {
  Dio dio;
  MovieDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List> getMovie(int page) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=141d346633a857c6ffb90bb1c17b46f4&language=en-US&page=$page');
    if (response.statusCode == 200) {
      final result = response.data['results'] as List;
      return result;
    } else {
      return [];
    }
  }
}
