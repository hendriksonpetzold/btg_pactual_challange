import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.movieFavoriteBox.listenable(),
        builder: (context, Box<MovieEntity> box, _) {
          List<MovieEntity> favoriteMovie =
              box.values.toList().cast<MovieEntity>();
          return ListView.builder(
            itemCount: favoriteMovie.length,
            itemBuilder: (context, index) {
              final list = favoriteMovie[index];
              return ListTile(
                title: Text(list.name),
              );
            },
          );
        },
      ),
    );
  }
}
