import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final String image = Get.arguments['image'];
  final String name = Get.arguments['name'];
  final String overview = Get.arguments['overview'];
  final double voteAverage = Get.arguments['vote_average'];
  final List<int> genreIds = Get.arguments['genre_ids'];
  final GetGenreUsecase getGenreUsecase = Get.find<GetGenreUsecaseImpl>();

  @override
  void onInit() {
    fetchGenres();
    super.onInit();
  }

  Future<void> fetchGenres() async {
    final result = await getGenreUsecase.execute();
    print(result);
  }
}
