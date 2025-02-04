import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/auth/login/signin_view_body.dart';
import 'package:php_notes_app/views/notes/add_notview_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Not',
            style: Kstyles.kTextStyle(18),
          ),
        ),
        body: AddNoteViewBody());
  }
}
