import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';
import 'package:btg_pactual_challange/external/movie_datasource_impl.dart';

import 'package:btg_pactual_challange/infra/repository/movie_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      GetMovieUsecaseImpl(
        repository: MovieRepositoryImpl(
          datasource: MovieDatasourceImpl(
            dio: Dio(),
          ),
        ),
      ),
    );
  }
}
