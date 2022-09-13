import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_movie/get_movie_usecase_impl.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetMovieUsecase datasource = Get.find<GetMovieUsecaseImpl>();
  RxBool isLoading = RxBool(true);
  int currentPage = 1;
  RxList<MovieEntity> movie = RxList([]);

  @override
  void onInit() {
    fetchMovie();

    super.onInit();
  }

  Future<void> fetchMovie() async {
    final result = await datasource.execute(currentPage);
    movie.value = result;
  }
}
