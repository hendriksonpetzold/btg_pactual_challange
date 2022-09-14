import 'package:btg_pactual_challange/presenter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeSearchFormField extends GetView<HomeController> {
  const HomeSearchFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchEditingController,
      onChanged: (value) {
        controller.searchMovies();
      },
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: 'Search for movies',
        isDense: true,
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
