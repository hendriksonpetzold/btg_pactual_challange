import 'package:btg_pactual_challange/presenter/pages/home/components/home_movie_card.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(
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
              itemCount: controller.movie.length,
              itemBuilder: (context, index) {
                final list = controller.movie[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeMovieCard(
                    image: list.image,
                    movieName: list.name,
                    releaseDate: list.releaseDate,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
