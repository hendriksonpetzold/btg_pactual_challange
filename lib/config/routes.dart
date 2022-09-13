import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_page.dart';

import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      binding: BindingsBuilder.put(
        () => HomeController(),
      ),
      name: '/',
      page: () => const HomePage(),
    )
  ];
}
