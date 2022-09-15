import 'package:btg_pactual_challange/domain/entities/genre_entity.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/movie_entity.dart';

class MovieDetailController extends GetxController {
  final String image = Get.arguments['image'];
  final String name = Get.arguments['name'];
  final String overview = Get.arguments['overview'];
  final String releaseDate = Get.arguments['release_date'];
  final double voteAverage = Get.arguments['vote_average'];
  final List<int> genreIds = Get.arguments['genre_ids'];
  RxBool isFavorite = RxBool(false);
  List<GenreEntity> genres = Get.arguments['genres'];
  RxList<String> genresById = RxList([]);
  late Box<MovieEntity> favoriteMovieBox;

  @override
  void onInit() async {
    getGenreById();
    favoriteMovieBox = Hive.box('favorite');
    super.onInit();
  }

  void getGenreById() {
    for (var element in genres) {
      if (genreIds.contains(element.id)) {
        genresById.add(element.name);
      }
    }
  }

  void onFavoriteButtonTap() {
    isFavorite.value = !isFavorite.value;
    if (isFavorite.value == true) {
      favoriteMovieBox.put(
        name,
        MovieEntity(
          image: image,
          name: name,
          releaseDate: releaseDate,
          overview: overview,
          voteAverage: voteAverage,
          genreIds: genreIds,
        ),
      );
    } else {
      favoriteMovieBox.delete(name);
    }
  }
}
