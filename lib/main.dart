import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/routes.dart';

void main (){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: kRoutes,
      
      
      initialRoute:kNotsView,
    );
  }
}