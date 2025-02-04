import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  StreamController streamControllervv = StreamController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomMaterilButton('Sign In', onPressed: () async {
                Navigator.pushNamed(context, kSigninView);
              }),
            ),
            SizedBox(width: 12),
            Expanded(
              child: CustomMaterilButton('Sign Up', onPressed: () {
                Navigator.pushNamed(context, kSignupView);
              }),
            )
          ],
        ),
        CustomMaterilButton("hive", onPressed: () async {
          Box box = Hive.box(kBoxName);
          print('======================');
          print(box.toMap());
          print('======================');
        }),
        SizedBox(
          height: 55,
        ),
      ],
    );
  }
}

Future<String> ss2(String mm2) async {
  return (mm2);
}
