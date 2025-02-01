import 'package:flutter/material.dart';
import 'package:php_notes_app/views/auth/login/signin_view.dart';
import 'package:php_notes_app/views/auth/signUp/sign_up_view.dart';
import 'package:php_notes_app/views/home_view/home_view.dart';
import 'package:php_notes_app/views/notes/add_note_view.dart';
import 'package:php_notes_app/views/notes/notes_view.dart';
import 'package:php_notes_app/views/success_view/success_view.dart';

const String kSignupView = 'signup';
const String kSigninView = 'login';
const String kNotesview = 'notesview';
const String kSuccessView = 'successView';
const String kHomeView= 'homeView';
const String kaddNotesView= 'addNotesview';

Map<String, Widget Function(BuildContext)> kRoutes = {
  kSignupView: (context) => SignUpView(),
  kSigninView: (context) => SigninView(),
  kNotesview: (context) => NotesView(),
  kSuccessView:(context) => SuccessView(),
  kHomeView  :(context) => HomeView(),
  kaddNotesView :(context) => AddNoteView(),
};
