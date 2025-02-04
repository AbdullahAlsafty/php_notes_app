import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

void main() async {
  debugPrint = (String? message, {int? wrapWidth}) {}; // تعطيل debugPrint

  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var _hiveBox = Hive.box(kBoxName).get(khiveUserInfo);

    return MaterialApp(
      routes: kRoutes,
      initialRoute: _hiveBox == null ? kHomeView : kNotesview,
    );
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(kBoxName)) {
    await Hive.openBox(kBoxName);
  }
}

//////////////////////////////////////////////////////////
//////////////////////////////////////////
//////////////////  main Test ////////////////////////
/////////////////////////////////////////////////

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:php_notes_app/cor/componants/custom_material_button.dart';

// void main() async {
//   runApp(TestView());
// }

// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TestViewScafolled(),
//     );
//   }
// }

// class TestViewScafolled extends StatelessWidget {
//   const TestViewScafolled({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomMaterilButton('Test', onPressed: () async {
//       Map<String, dynamic> testmap = {'u': 55};

//       print("===============================");
//       print("***************>${testmap['uff']}");
//       print("===============================");
//     });
//   }
// }

////////////////////////////////////////////////////////////
///////////////////////////////////////
