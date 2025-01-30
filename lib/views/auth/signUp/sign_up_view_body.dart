import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(padding: EdgeInsets.all(12), children: [
        Column(
          spacing: 50,
          children: [
            Image.asset(
              Kassets.kLogo,
              fit: BoxFit.fill,
            ),
            CustomTextFormFild(hintText: 'UserName'),
            CustomTextFormFild(hintText: 'email'),
            CustomTextFormFild(hintText: 'Password'),
            CustomMaterilButton(
              'Sign Up',
              onPressed: () {},
            )
          ],
        )
      ]),
    );
  }
}
