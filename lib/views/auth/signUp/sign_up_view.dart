import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/auth/signUp/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Singn Up',
            style: Kstyles.kTextStyle(18),
          ),
        ),
        body: SignUpViewBody());
  }
}
