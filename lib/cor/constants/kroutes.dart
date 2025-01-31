import 'package:flutter/material.dart';
import 'package:php_notes_app/views/auth/login/signin_view.dart';
import 'package:php_notes_app/views/auth/signUp/sign_up_view.dart';
import 'package:php_notes_app/views/notes/notes_view.dart';

const String kSignupView = 'signup';
const String kSigninView = 'login';
const String kNotesview = 'notesview';

Map<String, Widget Function(BuildContext)> kRoutes = {
  kSignupView: (context) => SignUpView(),
  kSigninView: (context) => SigninView(),
  kNotesview: (context) => NotesView(),
};
