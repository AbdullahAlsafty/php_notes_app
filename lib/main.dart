import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/constants/kBox_hive.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

void main() async {
  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: kRoutes,
      initialRoute: kHomeView,
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(kBoxName)) {
    await Hive.openBox(kBoxName);
  }
}
