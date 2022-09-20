import 'package:btg_pactual_challange/presenter/pages/home/components/home_movie_list_view.dart';
import 'package:btg_pactual_challange/presenter/components/search_form_field.dart';
import 'package:btg_pactual_challange/presenter/pages/home/components/home_select_movie_type_bar.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24,
        ),
        child: Column(
          children: [
            SearchFormField(
              controller: controller.searchEditingController,
              hintText: 'Search for movies',
              onChanged: (value) {
                controller.searchMovies();
              },
            ),
            const SizedBox(
              height: 8,
            ),
            const HomeSelectMovieTypeBar(),
            const SizedBox(
              height: 8,
            ),
            const Expanded(
              child: HomeMovieListView(),
            ),
          ],
        ),
      ),
    );
  }
}
