import 'package:flutter/material.dart';
import 'package:php_notes_app/views/auth/login/signin_view.dart';
import 'package:php_notes_app/views/auth/signUp/sign_up_view.dart';

const String kSignup = '/';
const String kSignin = '/login';

Map<String, Widget Function(BuildContext)> kRoutes = {
  kSignup: (context) => SignUpView(),
  kSignin: (context) => SigninView(),
};
