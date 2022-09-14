import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .6,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w220_and_h330_face${controller.image}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        controller.name,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      '${controller.voteAverage}',
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return Text(controller.genresById.join(','));
                }),
                Text(controller.overview),
                ElevatedButton(
                  onPressed: () {
                    controller.onFavoriteButtonTap();
                  },
                  child: const Text('teste'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
