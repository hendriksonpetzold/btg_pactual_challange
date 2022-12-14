import 'package:btg_pactual_challange/app.dart';
import 'package:btg_pactual_challange/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityHiveAdapter());
  await Hive.openBox<MovieEntity>('favorite');
  runApp(const App());
}
