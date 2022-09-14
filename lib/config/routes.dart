import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_page.dart';
import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/movie_detail/movie_detail_page.dart';

import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
        binding: BindingsBuilder.put(() => HomeController()),
        name: '/',
        page: () => const HomePage(),
        children: [
          GetPage(
            binding: BindingsBuilder.put(() => MovieDetailController()),
            name: '/movie_detail',
            page: () => const MovieDetailPage(),
          ),
        ]),
  ];
}
