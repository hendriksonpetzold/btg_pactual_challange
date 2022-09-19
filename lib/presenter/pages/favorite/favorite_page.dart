import 'package:btg_pactual_challange/presenter/components/search_form_field.dart';
import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchFormField(
              onTap: () {
                controller.updateList();
              },
              onChanged: (value) {
                controller.searchForMovies();
              },
              hintText: 'Search by name or release year',
              controller: controller.searchEditingController,
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index) {
                    final list = controller.searchList[index];
                    return GestureDetector(
                      onTap: () {
                        final box = controller.favoriteMovieBox.get(list.name);
                        Get.toNamed(
                          '/movie_detail',
                          arguments: {
                            'image': list.image,
                            'name': list.name,
                            'overview': list.overview,
                            'vote_average': list.voteAverage,
                            'genre_ids': list.genreIds,
                            'genres': controller.genres,
                            'release_date': list.releaseDate,
                            'is_favorite': box?.isFavorite ?? false,
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(list.name),
                        subtitle: Text(list.releaseDate),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
