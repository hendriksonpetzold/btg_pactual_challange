import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:btg_pactual_challange/presenter/components/search_form_field.dart';
import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends GetView<FavoriteController> {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchFormField(
              onTap: () {
                controller.updateList();
              },
              onChanged: (value) {
                controller.searchForMovies();
              },
              hintText: 'Search by name or release year',
              controller: controller.searchEditingController,
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.searchList.length,
                  itemBuilder: (context, index) {
                    final list = controller.searchList[index];
                    return ListTile(
                      title: Text(list.name),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
