import 'package:btg_pactual_challange/enums/movie_list_enum.dart';
import 'package:btg_pactual_challange/presenter/components/app_button.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSelectMovieTypeBar extends GetView<HomeController> {
  const HomeSelectMovieTypeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 40,
        child: Obx(
          () {
            return Row(
              children: [
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.all);
                    controller.getListByGenre();
                  },
                  label: 'All',
                  isSelected:
                      controller.checkActiveList(list: MovieListEnum.all).value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.action);
                    controller.getListByGenre();
                  },
                  label: 'Action',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.action)
                      .value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.adventure);
                    controller.getListByGenre();
                  },
                  label: 'Adventure',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.adventure)
                      .value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.comedy);
                    controller.getListByGenre();
                  },
                  label: 'Comedy',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.comedy)
                      .value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.drama);
                    controller.getListByGenre();
                  },
                  label: 'Drama',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.drama)
                      .value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.horror);
                    controller.getListByGenre();
                  },
                  label: 'Horror',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.horror)
                      .value,
                  height: 40,
                  width: 140,
                ),
                AppButton(
                  onTap: () {
                    controller.changeList(list: MovieListEnum.romance);
                    controller.getListByGenre();
                  },
                  label: 'Romannce',
                  isSelected: controller
                      .checkActiveList(list: MovieListEnum.romance)
                      .value,
                  height: 40,
                  width: 140,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
