import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase.dart';
import 'package:btg_pactual_challange/domain/usecases/get_genre/get_genre_usecase_impl.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final String image = Get.arguments['image'];
  final String name = Get.arguments['name'];
  final String overview = Get.arguments['overview'];
  final double voteAverage = Get.arguments['vote_average'];
  final List<int> genreIds = Get.arguments['genre_ids'];

  List<GenreEntity> genres = Get.arguments['genres'];
  RxList<String> genresById = RxList([]);

  @override
  void onInit() async {
    getGenreById();
    super.onInit();
  }

  void getGenreById() {
    for (var element in genres) {
      if (genreIds.contains(element.id)) {
        genresById.add(element.name);
      }
    }
  }
}
