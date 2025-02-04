import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class GetSignInButton extends StatelessWidget {
  const GetSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(kSigninView);
      },
      child: Text(
        'Sign in >>',
        style: Kstyles.kTextStyle(22, const Color.fromARGB(255, 136, 182, 220)),
      ),
    );
  }
}
