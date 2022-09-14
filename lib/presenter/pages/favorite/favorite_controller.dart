import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  late Box<MovieEntity> movieFavoriteBox;

  @override
  void onInit() {
    movieFavoriteBox = Hive.box('favorite');
    super.onInit();
  }
}
