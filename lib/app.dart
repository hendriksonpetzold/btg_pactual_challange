import 'package:btg_pactual_challange/config/initial_bindings.dart';
import 'package:btg_pactual_challange/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      title: 'Btg Challange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.routes,
    );
  }
}
