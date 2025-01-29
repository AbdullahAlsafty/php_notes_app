import 'package:flutter/material.dart';
import 'package:php_notes_app/views/nots_view.dart';

const String kNotsView = '/';


  Map<String, Widget Function(BuildContext  )> kRoutes ={  kNotsView:(context )=> NotsView()};