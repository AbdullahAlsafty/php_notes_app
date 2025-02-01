import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/constants/kBox_hive.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
