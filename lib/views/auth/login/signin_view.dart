import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/auth/login/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: Kstyles.kTextStyle(18),
          ),
        ),
        body: SigninViewBody());
  }
}
