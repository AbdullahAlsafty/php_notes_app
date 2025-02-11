import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
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
        }),
        SizedBox(
          height: 55,
        ),
      ],
    );
  }
}

