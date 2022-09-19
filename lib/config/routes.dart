import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';

import 'package:btg_pactual_challange/presenter/pages/initial/initial_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/initial/initial_page.dart';
import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_page.dart';

import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      binding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(InitialController());
        Get.put(FavoriteController());
      }),
      name: '/',
      page: () => const InitialPage(),
      children: [
        GetPage(
          binding: BindingsBuilder.put(() => MovieDetailController()),
          name: '/movie_detail',
          page: () => const MovieDetailPage(),
        ),
      ],
    ),
  ];
}
