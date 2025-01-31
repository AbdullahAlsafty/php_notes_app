import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomMaterilButton('Sign In', onPressed: () {
          Navigator.pushNamed(context, kSigninView);
        }),
        CustomMaterilButton('Sign Up', onPressed: () {
          Navigator.pushNamed(context, kSignupView);
        })
      ],
    );
  }
}
