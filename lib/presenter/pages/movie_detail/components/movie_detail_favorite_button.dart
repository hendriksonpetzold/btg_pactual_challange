import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailFavoriteButton extends GetView<MovieDetailController> {
  const MovieDetailFavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Obx(
          () {
            return GestureDetector(
              onTap: () {
                controller.onFavoriteButtonTap();
              },
              child: controller.isFavorite.value
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border_outlined),
            );
          },
        ),
      ),
    );
  }
}
