import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: ListView(padding: EdgeInsets.all(12), children: [
        Column(
          spacing: 50,
          children: [
            Image.asset(
              Kassets.kLogo,
              fit: BoxFit.fill,
            ),
            CustomTextFormFild(hintText: 'email'),
            CustomTextFormFild(hintText: 'Password'),
            CustomMaterilButton(
              'Sign in',
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  Navigator.pushNamed(context, kSignup);
                }
              },
            )
          ],
        )
      ]),
    );
  }

  String get successSnackBar => 'data';
}
