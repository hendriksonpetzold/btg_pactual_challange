import 'package:btg_pactual_challange/presenter/pages/home/components/home_movie_card.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeMovieListView extends GetView<HomeController> {
  const HomeMovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: () {
            controller.onRefresh();
          },
          onLoading: () {
            controller.onLoading();
          },
          child: ListView.builder(
            itemCount: controller.searchMovie.length,
            itemBuilder: (context, index) {
              final list = controller.searchMovie[index];
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      '/movie_detail',
                      arguments: {
                        'image': list.image,
                        'name': list.name,
                        'overview': list.overview,
                        'vote_average': list.voteAverage,
                        'genre_ids': list.genreIds,
                      },
                    );
                  },
                  child: HomeMovieCard(
                    image: list.image,
                    movieName: list.name,
                    releaseDate: list.releaseDate,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
