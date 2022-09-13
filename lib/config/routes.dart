import 'package:btg_pactual_challange/external/movie_datasource_impl.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
