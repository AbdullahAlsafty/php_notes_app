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
   var  _hiveBox = Hive.box(kBoxName).get('userInfo');
    return MaterialApp(
      routes: kRoutes,
      initialRoute:_hiveBox==null||_hiveBox.isEmpty? kHomeView:kNotesview,
    );
  }
}

Future<void> initHive() async {
 
 
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(kBoxName)) {
    await Hive.openBox(kBoxName);
  }
}
