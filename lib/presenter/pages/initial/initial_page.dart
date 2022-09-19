import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_controller.dart';
import 'package:btg_pactual_challange/presenter/pages/favorite/favorite_page.dart';
import 'package:btg_pactual_challange/presenter/pages/home/home_page.dart';
import 'package:btg_pactual_challange/presenter/pages/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.index.value,
          children: const [
            HomePage(),
            FavoritePage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: controller.index.value,
            onTap: (newIndex) {
              controller.index.value = newIndex;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
          );
        },
      ),
    );
  }
}
