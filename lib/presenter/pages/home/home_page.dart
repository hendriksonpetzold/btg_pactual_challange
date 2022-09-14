import 'package:btg_pactual_challange/presenter/pages/home/components/home_movie_list_view.dart';
import 'package:btg_pactual_challange/presenter/pages/home/components/home_search_form_field.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: const [
            HomeSearchFormField(),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: HomeMovieListView(),
            ),
          ],
        ),
      ),
    );
  }
}
